require 'inspec/utils/filter'
require 'inspec/utils/parser'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class AideConf < Inspec.resource(1)
    name 'aide_conf'
    supports platform: 'unix'
    desc 'Use the aide_conf InSpec audit resource to test the rules established for
      the file integrity tool AIDE. Controlled by the aide.conf file typically at /etc/aide.conf.'
    example <<~EXAMPLE
      describe aide_conf do
        its('selection_lines') { should include '/sbin' }
      end

      describe aide_conf.where { selection_line == '/bin' } do
        its('rules.flatten') { should include 'r' }
      end

      describe aide_conf.all_have_rule('sha512') do
        it { should eq true }
      end
    EXAMPLE

    attr_reader :params

    include CommentParser
    include FileReader

    def initialize(aide_conf_path = nil)
      @conf_path = aide_conf_path || '/etc/aide.conf'
      @content = nil
      @rules = nil
      read_content
    end

    def all_have_rule(rule)
      # Case when file didn't exist or perms didn't allow an open
      return false if @content.nil?

      lines = @params.reject { |line| line['rules'].include? rule }
      lines.empty?
    end

    filter = FilterTable.create
    filter.register_column(:selection_lines, field: 'selection_line')
          .register_column(:rules,           field: 'rules')

    filter.install_filter_methods_on_resource(self, :params)

    private

    def read_content
      return @content unless @content.nil?
      @rules = {}

      raw_conf = read_file_content(@conf_path)

      # If there is a file and it contains content, continue
      @content = filter_comments(raw_conf.lines)
      @params = parse_conf(@content)
    end

    def filter_comments(data)
      content = []
      data.each do |line|
        content_line, = parse_comment_line(line, comment_char: '#', standalone_comments: false)
        content.push(content_line)
      end
      content
    end

    def parse_conf(content)
      params = []
      content.each do |line|
        param = parse_line(line)
        if !param['selection_line'].nil?
          params.push(param)
        end
      end
      params
    end

    def parse_line(line)
      line_and_rules = {}
      # Case when line is a rule line
      if line.include?(' = ')
        parse_rule_line(line)
      # Case when line is a selection line
      elsif line.start_with?('/', '!', '=')
        line_and_rules = parse_selection_line(line)
      end
      line_and_rules
    end

    def parse_rule_line(line)
      line.gsub!(/\s+/, '')
      rule_line_arr = line.split('=')
      rules_list = rule_line_arr.last.split('+')
      rule_name = rule_line_arr.first
      rules_list.each_index do |i|
        # Cases where rule respresents one or more other rules
        if @rules.key?(rules_list[i])
          rules_list[i] = @rules[rules_list[i]]
        end
        rules_list[i] = handle_multi_rule(rules_list, i)
      end
      @rules[rule_name] = rules_list.flatten
    end

    def parse_selection_line(line)
      selec_line_arr = line.split(' ')
      selection_line = selec_line_arr.first
      selection_line.chop! if selection_line.end_with?('/')
      rule_list = selec_line_arr.last.split('+')
      rule_list.each_index do |i|
        hash_list = @rules[rule_list[i]]
        # Cases where rule respresents one or more other rules
        if !hash_list.nil?
          rule_list[i] = hash_list
        end
        rule_list[i] = handle_multi_rule(rule_list, i)
      end
      rule_list.flatten!
      {
        'selection_line' => selection_line,
        'rules' => rule_list,
      }
    end

    def handle_multi_rule(rule_list, i)
      # Rules that represent multiple rules (R,L,>)
      r_rules = %w{p i l n u g s m c md5}
      l_rules = %w{p i l n u g}
      grow_log_rules = %w{p l u g i n S}

      case rule_list[i]
      when 'R'
        return r_rules
      when 'L'
        return l_rules
      when '>'
        return grow_log_rules
      end
      rule_list[i]
    end
  end
end
