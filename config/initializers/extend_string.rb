class String
  def to_boolean
    return true if %w[true yes si 1].include?(downcase)

    false
  end
end

class NilClass
  def to_boolean
    false
  end
end

class TrueClass
  def to_boolean
    true
  end

  def to_i
    1
  end
end

class FalseClass
  def to_boolean
    false
  end

  def to_i
    0
  end
end

class Integer
  delegate :to_boolean, to: :to_s
end
