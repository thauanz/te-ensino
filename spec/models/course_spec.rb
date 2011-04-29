require 'spec_helper'

describe Course do
  fixtures :users, :courses, :matriculations
  
  let(:user){ users(:teacher) }
  let(:course){ courses(:sistema) }
  let(:matriculation){ matriculations(:one) }
  
  describe "invalid" do
    it "should reject if name is not given" do
      course.name = nil
      course.should have(1).error_on(:name)
      course.errors[:name].should == ["can't be blank"]
    end
    
    it "should reject if description is not given" do
      course.description = nil
      course.should have(1).error_on(:description)
      course.errors[:description].should == ["can't be blank"]
    end
    
    it "should reject if price is not given" do
      course.price = nil
      course.should have(1).error_on(:price)
      course.errors[:price].should == ["can't be blank"]
    end
    
    it "should validate uniqueness name" do
      course1 = Course.new(:name => "BD")
      course1.save
      course1.errors[:name].should == ["has already been taken"]
    end
  end
  
  describe "valid association user" do
    it "should has and belongs to many users" do
      association = Course.reflect_on_association(:users)
      association.should_not be_nil
      association.macro.should == :has_and_belongs_to_many
    end 
    it "should has many matriculations" do
      association = Course.reflect_on_association(:matriculations)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    it "should has many alerts" do
      association = Course.reflect_on_association(:alerts)
      association.should_not be_nil
      association.macro.should == :has_many
    end
    it "should has many lessons" do
      association = Course.reflect_on_association(:lessons)
      association.should_not be_nil
      association.macro.should == :has_many
    end
  end
end
