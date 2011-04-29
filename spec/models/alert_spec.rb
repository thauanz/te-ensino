require 'spec_helper'

describe Alert do
  fixtures :alerts
  
  let(:alert) { alerts(:one)}
  
  describe "invalid" do
    it "should reject if title is not given" do
      alert.title = nil
      alert.should have(1).error_on(:title)
      alert.errors[:title].should == ["can't be blank"]
    end
    it "should reject if description is not given" do
      alert.description = nil
      alert.should have(1).error_on(:description)
      alert.errors[:description].should == ["can't be blank"]
    end
    it "should reject if expire is not given" do
      alert.expire = nil
      alert.should have(1).error_on(:expire)
      alert.errors[:expire].should == ["can't be blank"]
    end
    it "should reject if course is not given" do
      alert.course_id = nil
      alert.should have(1).error_on(:course_id)
      alert.errors[:course_id].should == ["can't be blank"]
    end
  end
  
  context "validations" do
    it "should belongs to course" do
      association = Alert.reflect_on_association(:course)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
  end
end
