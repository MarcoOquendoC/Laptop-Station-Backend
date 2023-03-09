require 'rails_helper'

RSpec.describe Item, type: :model do
  subject do
    Item.new(title: 'HP ENVY Laptop',
             item_model: 'G532LW-AZ088T',
             serial_n: '00000_000_0000000',
             image: 'default.jpg',
             description: "Experience seamless connectivity with the HP Envy 17.3.
                                  Combine the creative power of your devices with HP Palette.
                                  With a large 17.3 color-calibrated display, you get accurate colors.
                                  Plus, it has the Intel® Processor[1] to handle what you throw at it.
                                  Look and sound your best on video calls with a 5MP camera[2] with Auto
                                  Frame and AI Noise Reduction.",
             brand: 'HP')
  end
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'item model should be present' do
    subject.item_model = nil
    expect(subject).to_not be_valid
  end

  it 'serial number should be present' do
    subject.serial_n = nil
    expect(subject).to_not be_valid
  end

  it 'image should be present' do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'brand should be present' do
    subject.brand = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 60
    expect(subject).to_not be_valid
  end

  it 'item model should not be too long' do
    subject.item_model = 'b' * 60
    expect(subject).to_not be_valid
  end

  it 'serial number should not be too long' do
    subject.serial_n = 'c' * 60
    expect(subject).to_not be_valid
  end

  it 'brand should not be too long' do
    subject.brand = 'd' * 60
    expect(subject).to_not be_valid
  end
end
