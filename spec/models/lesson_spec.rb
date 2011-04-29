require 'spec_helper'

describe Lesson do
  fixtures :lessons
  
  let(:lesson){ lessons(:prova) }
  
  describe "invalid" do
    it "should reject if theme is not given" do
      lesson.theme = nil
      lesson.should have(1).error_on(:theme)
      lesson.errors[:theme].should == ["can't be blank"]
    end
    
    it "should reject if description is not given" do
      lesson.description = nil
      lesson.should have(1).error_on(:description)
      lesson.errors[:description].should == ["can't be blank"]
    end
    
    it "should reject if date_at is not given" do
      lesson.date_at = nil
      lesson.should have(1).error_on(:date_at)
      lesson.errors[:date_at].should == ["can't be blank"]
    end
  end
  
  describe "valid association" do

    it "should belongs to user" do
      association = Lesson.reflect_on_association(:user)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    it "should belongs to course" do
      association = Lesson.reflect_on_association(:course)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
  end
end
