class String

  # Form can be either :utc (default) or :local.
  def to_time(form = :utc)
    return nil if self.blank?
    Timeliness::Parser.parse(self, :datetime, :zone => form)
  end

  def to_date
    return nil if self.blank?
    values = Timeliness::Parser._parse(self, :date).map { |arg| arg || 0 }
    ::Date.new(*values[0..2])
  end

  def to_datetime
    return nil if self.blank?
    values = Timeliness::Parser._parse(self, :datetime).map { |arg| arg || 0 }
    values[7] = values[7]/24.hours.to_f if values[7] != 0
    values[5] += Rational(values.delete_at(6), 1000000)
    ::DateTime.civil(*values)
  end
end
