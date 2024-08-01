Date::DATE_FORMATS[:default] = '%m/%d/%Y'
Time::DATE_FORMATS[:default] = '%m/%d/%Y %H:%M:%S'
DateTime::DATE_FORMATS[:default] = '%m/%d/%Y %H:%M:%S'

class Date
  def to_s(_format = :default)
    formatter = '%m/%d/%Y'
    if formatter.respond_to?(:call)
      formatter.call(self).to_s
    else
      strftime(formatter)
    end
  end
end

class DateTime
  def to_s(_format = :default)
    formatter = '%m/%d/%Y %H:%M:%S'
    if formatter.respond_to?(:call)
      formatter.call(self).to_s
    else
      strftime(formatter)
    end
  end
end

class Time
  def to_s(_format = :default)
    formatter = '%m/%d/%Y %H:%M:%S'
    if formatter.respond_to?(:call)
      formatter.call(self).to_s
    else
      strftime(formatter)
    end
  end
end

class ActiveSupport::TimeWithZone
  def to_s(_format = :default)
    formatter = '%m/%d/%Y %H:%M:%S'
    if formatter.respond_to?(:call)
      formatter.call(self).to_s
    else
      strftime(formatter)
    end
  end
end
