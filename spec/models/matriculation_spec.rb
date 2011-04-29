require 'spec_helper'

describe Matriculation do
  fixtures :users, :courses
  
  let(:matriculation) { Matriculation.new(:user => User.last , :course => courses(:sistema)) }
  
  describe "validate" do
    it "should have a user" do
      matriculation.user_id = nil
      matriculation.should have(1).error_on(:user_id)
      matriculation.errors[:user_id].should == ["can't be blank"]
    end
    
    it "should have a course" do
      matriculation.course_id = nil
      matriculation.should have(1).error_on(:course_id)
      matriculation.errors[:course_id].should == ["can't be blank"]
    end
    
    it "should be unique user to course" do
      matriculation.save
      matriculation1 = Matriculation.new(:user => User.last , :course => courses(:sistema))
      matriculation1.save
      matriculation1.errors[:course_id].should == ["has already been taken"]
    end
    
    #it "should can not teacher register for your course" do
    #  course = Course.new(:name => "Sistema de informacao", :description => "Lorem Ipsum is simply dummy .", :enabled => true, :price => 300.89, :amount => 30)
    #  course.users << User.last
    #  m = Matriculation.new(:user => User.last, :course => course)
    #  m.save
    #  m.errors[:user_id].should == ["teacher can't register for this course"]
    #end
  end
  
  describe "validate association" do
    it "should have belongs to course" do
      association = Matriculation.reflect_on_association(:course)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
    it "should have belongs to user" do
      association = Matriculation.reflect_on_association(:user)
      association.should_not be_nil
      association.macro.should == :belongs_to
    end
  end
  
  context "alerts the student(user)" do
    it "should have alerts the course" do
      user = User.create(:name => "Sabrina", :role => "teacher", :email => "sabrina@gmail.com", :password => "1234567")
      matriculate = Matriculation.create(:user => user, :course => Course.first)
      matriculate.course.alerts.should_not be_nil
      matriculate.course.alerts.each do |alert|
        alert.students.each do |student|
          student.should == user
        end
      end
    end
  end
end
