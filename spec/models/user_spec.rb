require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(first_name: 'Josue',
             last_name: 'Benavides',
             email: 'jdbs9514@gmail.com')
  end
  before { subject.save }

  it 'first name should be present' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'last_name should be present' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'first name should not be too short' do
    subject.first_name = 'Jo'
    expect(subject).to_not be_valid
  end

  it 'first name should not be too long' do
    subject.first_name = 'j' * 60
    expect(subject).to_not be_valid
  end

  it 'first name should not have symbols' do
    subject.first_name = 'Josu-e'
    expect(subject).to_not be_valid
  end

  it 'last name should not be too short' do
    subject.last_name = 'a'
    expect(subject).to_not be_valid
  end

  it 'last name should not be too long' do
    subject.last_name = 'j' * 60
    expect(subject).to_not be_valid
  end

  it 'last name should not have symbols' do
    subject.first_name = 'Benavi*/des'
    expect(subject).to_not be_valid
  end

  it 'email should not be too long' do
    subject.last_name = '@mail.com' * 60
    expect(subject).to_not be_valid
  end
end
