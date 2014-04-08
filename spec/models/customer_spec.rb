require 'spec_helper'

describe Customer do
  it 'is valid with name, contact, telephone, and email' do
    expect(build(:customer)).to be_valid
  end

  it 'is invalid without a name' do
    customer = build(:customer, name: nil)
    expect(customer).to have(1).errors_on(:name)
  end

  it 'is invalid without a contact' do
    customer = build(:customer, contact: nil)
    expect(customer).to have(1).errors_on(:contact)
  end

  it 'is invalid without a telephone' do
    customer = build(:customer, telephone: nil)
    expect(customer).to have(1).errors_on(:telephone)
  end

  it 'is invalid without an email' do
    customer = build(:customer, email: nil)
    expect(customer).to have(1).errors_on(:email)
  end
end
