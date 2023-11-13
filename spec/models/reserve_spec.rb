require 'rails_helper'

RSpec.describe Reserve, type: :model do
  subject { Reserve.new(date: 'DD/MM/YY') }
  before { subject.save }

  it 'date should be present' do
    subject.date = nil
    expect(subject).to_not be_valid
  end
end
