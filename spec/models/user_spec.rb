require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'check presence' do
  subject   { create(:user) }
   it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'validations' do
    it { should have_many(:blogs) }
  end
end
