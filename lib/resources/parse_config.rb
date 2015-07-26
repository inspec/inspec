# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

class PConfig < Vulcano::Resource

  def initialize content
    @runner = Specinfra::Runner
    @content = content
    @params = nil
    read_content
  end

  def method_missing name
    @params || read_content
    @params[name.to_s]
  end

  def read_content
    # parse the file
    @params = SimpleConfig.new(@content,
      multiple_values: false
    ).params
    @content
  end
end