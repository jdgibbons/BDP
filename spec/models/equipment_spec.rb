require 'spec_helper'

describe Equipment do
  it 'is valid with name, rate, and units' do
    expect(build(:equipment)).to be_valid
  end

  it 'is invalid without a name' do
    equipment = build(:equipment, name: nil)
    expect(equipment).to have(1).errors_on(:name)
  end

  it 'is invalid without a rate' do
    equipment = build(:equipment, rate: nil)
    expect(equipment).to have(1).errors_on(:rate)
  end

  it 'is invalid without units' do
    equipment = build(:equipment, units: nil)
    expect(equipment).to have(1).errors_on(:units)
  end
end
