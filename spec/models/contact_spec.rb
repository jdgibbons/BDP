require 'spec_helper'

describe Contact do
  it 'is valid with name, telephone, and email' do
    expect(build(:contact)).to be_valid
  end

  it 'is invalid without a name' do
    contact = build(:contact, name: nil)
    expect(contact).to have(1).errors_on(:name)
  end

  it 'is valid without a telephone' do
    contact = build(:contact, telephone: nil)
    expect(contact).to be_valid
  end

  it 'is valid without an email' do
    contact = build(:contact, email: nil)
    expect(contact).to be_valid
  end
end
