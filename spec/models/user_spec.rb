require 'rails_helper'

RSpec.describe User, type: :model do
  describe print_text('FACTORY', color: :purple) do
    it 'has a valid factory' do
      expect(build(:user))
    end
  end

  describe print_text('ASSOCIATIONS', color: :purple) do
  end

  describe print_text('VALIDATIONS', color: :purple) do
    subject { build(:user) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should allow_value(Faker::Internet.email).for(:email) }
    it { should_not allow_value(Faker::Name.first_name).for(:email) }
  end

end
