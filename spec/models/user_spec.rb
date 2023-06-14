require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tash', posts_counter: 4) }

  before { subject.save }

  context 'When testing validations' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be present' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should allow valid values' do
      subject.posts_counter = 20
      expect(subject).to be_valid
    end
  end
end
