require 'spec_helper'

describe Incidental do
  it 'is valid with description and cost' do
    expect(build(:incidental)).to be_valid
  end

  it 'is invalid without a description' do
    incidental = build(:incidental, description: nil)
    expect(incidental).to have(1).errors_on(:description)
  end

  it 'is invalid without a cost' do
    incidental = build(:incidental, cost: nil)
    expect(incidental).to have(1).errors_on(:cost)
  end
end
