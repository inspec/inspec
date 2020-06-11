module Timeliness
  module Helpers

    def full_hour(hour, meridian)
      hour = hour.to_i
      return hour if meridian.nil?
      if meridian.delete('.').downcase == 'am'
        raise(ArgumentError) if hour == 0 || hour > 12
        hour == 12 ? 0 : hour
      else
        hour == 12 ? hour : hour + 12
      end
    end

    def unambiguous_year(year)
      if year.length <= 2
        century = Time.now.year.to_s[0..1].to_i
        century -= 1 if year.to_i >= Timeliness.ambiguous_year_threshold
        year = "#{century}#{year.rjust(2,'0')}"
      end
      year.to_i
    end
    
    def month_index(month)
      return month.to_i if month.to_i > 0 || /0+/ =~ month
      month.length > 3 ? month_names.index(month.capitalize) : abbr_month_names.index(month.capitalize)
    end

    def month_names
      i18n_loaded? ? I18n.t('date.month_names') : Date::MONTHNAMES
    end

    def abbr_month_names
      i18n_loaded? ? I18n.t('date.abbr_month_names') : Date::ABBR_MONTHNAMES
    end

    def microseconds(usec)
      (".#{usec}".to_f * 1_000_000).to_i
    end

    def offset_in_seconds(offset)
      sign = offset =~ /^-/ ? -1 : 1
      parts = offset.scan(/\d\d/).map {|p| p.to_f }
      parts[1] = parts[1].to_f / 60
      (parts[0] + parts[1]) * sign * 3600
    end

    def i18n_loaded?
      defined?(I18n)
    end

  end
end
