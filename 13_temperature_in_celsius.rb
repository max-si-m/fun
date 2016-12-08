class TemperatureInCelsius
  include Comparable
  ABSOLUTE_ZERO = -273.15

  def initialize(value)
    degrees = Float(value)
    raise ArgumentError, "Invalid temperature #{value}" if degrees < ABSOLUTE_ZERO
    @value = degrees
  end

  def <=>(other)
    @value <=> other.to_f
  end

  def hash
    @value.hash
  end

  def to_f
    @value
  end

  def to_i
    @value.to_i
  end

  def to_s
    "#{@value}C"
  end
end
