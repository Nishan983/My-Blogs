require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'check presence' do
  subject   { create(:user,email:nil) }
  # it { should have_many(:blogs) }
   it { should validate_presence_of(:email) }
  end

  

  
# it "should validate uniqueness of email" do
#   user1 = FactoryBot.create(:user)
#   user1.save
#   user2 = FactoryBot.create(:user)
#   expect { user2.save }.to raise_error(
#     # ActiveRecord::RecordInvalid
#     Duplicate Email
#   )      
# end
end
# it { is_expected.to validate_uniqueness_of(:name)