require 'spec_helper'

describe Forum do
  fixtures :forums
  
  let(:forum) {forums(:one)}
  
  it "should validate association user" do
    association = Forum.reflect_on_association(:user)
    association.should_not be_nil
    association.macro.should == :belongs_to
  end
  
  it "should validate association has many messages" do
    association = Forum.reflect_on_association(:messages)
    association.should_not be_nil
    association.macro.should == :has_many
  end
  
  it "should reject if title is not given" do
    forum.title = nil
    forum.should have(1).error_on(:title)
    forum.errors[:title].should == ["can't be blank"]
  end
  
end
