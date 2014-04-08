require 'spec_helper'

describe Material do
  it 'is valid with name, unit_type, unit_price, notes, and roll_cost' do
    expect(build(:material)).to be_valid
  end

  it 'is invalid without a name' do
    material = build(:material, name: nil)
    expect(material).to have(1).errors_on(:name)
  end

  it 'is invalid without a unit_type' do
    material = build(:material, unit_type: nil)
    expect(material).to have(1).errors_on(:unit_type)
  end

  it 'is invalid without a unit_price' do
    material = build(:material, unit_price: nil)
    expect(material).to have(1).errors_on(:unit_price)
  end

  it 'is valid without notes' do
    material = build(:material, notes: nil)
    expect(material).to be_valid
  end

  it 'is valid without roll_cost' do
    material = build(:material, roll_cost: nil)
    expect(material).to be_valid
  end
end
