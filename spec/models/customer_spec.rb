require 'spec_helper'

describe Customer do
  it 'is valid with name' do
    expect(build(:customer)).to be_valid
  end

  it 'is invalid without a name' do
    customer = build(:customer, name: nil)
    expect(customer).to have(1).errors_on(:name)
  end
end
