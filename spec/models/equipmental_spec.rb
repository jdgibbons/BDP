require 'spec_helper'

describe Equipmental do
  it 'is valid with name, rate, and units' do
    expect(build(:equipmental)).to be_valid
  end

  it 'is invalid without a name' do
    equipmental = build(:equipmental, name: nil)
    expect(equipmental).to have(1).errors_on(:name)
  end

  it 'is invalid without a rate' do
    equipmental = build(:equipmental, rate: nil)
    expect(equipmental).to have(1).errors_on(:rate)
  end

  it 'is invalid without units' do
    equipmental = build(:equipmental, units: nil)
    expect(equipmental).to have(1).errors_on(:units)
  end
end
