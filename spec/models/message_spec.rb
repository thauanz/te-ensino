require 'spec_helper'

describe Message do
  fixtures :messages
  
  let(:message) {messages(:one)}
  
  it "should reject if content is not given" do
    message.content = nil
    message.should have(1).error_on(:content)
    message.errors[:content].should == ["can't be blank"]
  end
  
  it "should validate association user" do
    association = Message.reflect_on_association(:user)
    association.should_not be_nil
    association.macro.should == :belongs_to
  end
  
  it "should validate association forum" do
    association = Message.reflect_on_association(:forum)
    association.should_not be_nil
    association.macro.should == :belongs_to
  end
end
