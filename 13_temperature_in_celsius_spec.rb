require_relative '13_temperature_in_celsius'

RSpec.describe TemperatureInCelsius do
  let(:value) { rand }
  let(:valid_item) { TemperatureInCelsius.new(value) }
  let(:absolute_zero) { TemperatureInCelsius::ABSOLUTE_ZERO }
  let(:invalid_item) { TemperatureInCelsius.new(absolute_zero - value) }

  it "raise ArgumentError when argument less than -273.15}" do
    expect { invalid_item }.to raise_error(ArgumentError)
  end

  it '#hash' do
    expect(valid_item.hash).to eql(value.hash)
  end

  it '#to_f' do
    expect(valid_item.to_f).to eql(value)
  end

  it '#to_i' do
    expect(valid_item.to_i).to eql(value.to_i)
  end

  it '#to_s' do
    expect(valid_item.to_s).to eql("#{value}C")
  end

  it 'check comparation method' do
    new_item = TemperatureInCelsius.new(value + 1)
    expect(new_item).to be > valid_item
  end
end
