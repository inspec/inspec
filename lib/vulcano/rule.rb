# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

module Vulcano
  class Rule
    def initialize(id, _opts, &block)
      @id = id
      @impact = nil
      @__code = ''
      @__block = block
      @title = nil
      @desc = nil
      # not changeable by the user:
      @profile_id = nil
      @checks = []
      # evaluate the given definition
      instance_eval(&block) if block_given?
    end

    def id(*_)
      # never overwrite the ID
      @id
    end

    def impact(v = nil)
      @impact = v unless v.nil?
      @impact
    end

    def title(v = nil)
      @title = v unless v.nil?
      @title
    end

    def desc(v = nil)
      @desc = v unless v.nil?
      @desc
    end

    def describe(sth, &block)
      @checks.push(['describe', [sth], block])
    end

    def self.merge(dst, src)
      if src.id != dst.id
        # TODO: register an error, this case should not happen
        return
      end
      sp = src.instance_variable_get(:@profile_id)
      dp = dst.instance_variable_get(:@profile_id)
      if sp != dp
        # TODO: register an error, this case should not happen
        return
      end
      # merge all fields
      dst.impact(src.impact) unless src.impact.nil?
      dst.title(src.title)   unless src.title.nil?
      dst.desc(src.desc)     unless src.desc.nil?
      # merge indirect fields
      # checks defined in the source will completely eliminate
      # all checks that were defined in the destination
      sc = src.instance_variable_get(:@checks)
      unless sc.nil? || sc.empty?
        dst.instance_variable_set(:@checks, sc)
      end
    end

    # Get the full id consisting of profile id + rule id
    # for the rule. If the rule's profile id is empty,
    # the given profile_id will be used instead and also
    # set for the rule.
    def self.full_id(profile_id, rule)
      if rule.is_a?(String) or rule.nil?
        rid = rule
      else
        # As the profile context is exclusively pulled with a
        # profile ID, attach it to the rule if necessary.
        rid = rule.instance_variable_get(:@id)
        if rid.nil?
          # TODO: Message about skipping this rule
          # due to missing ID
          return nil
        end
      end
      pid = rule.instance_variable_get(:@profile_id)
      if pid.nil?
        rule.instance_variable_set(:@profile_id, profile_id)
        pid = profile_id
      end
      if pid.nil? or pid.empty?
        return rid
      else
        return "#{pid}/#{rid}"
      end
    end
  end
end
