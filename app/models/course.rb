class Course < ActiveRecord::Base
  has_many :matriculations, :dependent => :destroy
  has_many :alerts
  has_and_belongs_to_many :users  #professor
  has_many :lessons, :dependent => :destroy
  
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

end
