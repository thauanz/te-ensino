class Course < ActiveRecord::Base

  has_many :matriculations, :dependent => :destroy
  has_many :alerts
  has_many :chats
  has_many :lessons, :dependent => :destroy   
  has_and_belongs_to_many :users  #professor
  belongs_to :user, :class_name => "User", :foreign_key => "tutor_id"
  
  validates_presence_of :users, :name, :description, :workload, :amount, :price
  validates_uniqueness_of :name
  
  def matriculations_active
    self.matriculations.where(:enabled => true).present?
  end
  
  def teachers
    self.users.collect {|user| "#{user.name} (#{user.email})" }.join("<br/>").html_safe
  end
  
  scope :activated, where(:enabled => true)
  
  scope :search, lambda { |terms| 
    where("name LIKE :t OR description LIKE :t OR price LIKE :t OR workload LIKE :t", :t => "%#{terms}%")
  }
    
  def tutors
    User.where(:id => self.tutor_id).collect {|user| "#{user.name} (#{user.email})" }.join("<br/>").html_safe
  end

end
