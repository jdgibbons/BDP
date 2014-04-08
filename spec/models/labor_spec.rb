require 'spec_helper'

describe Labor do
  it 'is valid with name, rate, and units' do
    expect(build(:labor)).to be_valid
  end

  it 'is invalid without a name' do
    labor = build(:labor, name: nil)
    expect(labor).to have(1).errors_on(:name)
  end

  it 'is invalid without a rate' do
    labor = build(:labor, rate: nil)
    expect(labor).to have(1).errors_on(:rate)
  end

  it 'is invalid without units' do
    labor = build(:labor, units: nil)
    expect(labor).to have(1).errors_on(:units)
  end
end
