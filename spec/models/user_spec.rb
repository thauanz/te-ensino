require 'spec_helper'

describe User do
  fixtures :users
  
  let(:user){ users(:admin) }
  
  describe "invalid" do
    it "should reject if name is not given" do
      user.name = nil
      user.should have(1).error_on(:name)
      user.errors[:name].should == ["can't be blank"]
    end
    
    it "should reject if email is not given" do
      user.email = nil
      user.should have(1).error_on(:email)
      user.errors[:email].should == ["can't be blank"]
    end
    
    it "should reject if role is not given" do
      user.role = nil
      user.should have(1).error_on(:role)
      user.errors[:role].should == ["can't be blank"]
    end
  end
  
  describe "valid association" do
    it "should has and belongs to many course" do
      association = User.reflect_on_association(:courses)
      association.should_not be_nil
      association.macro.should == :has_and_belongs_to_many
    end
  end

end
