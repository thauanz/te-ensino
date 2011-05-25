class User < ActiveRecord::Base
  default_scope order('role, name')
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :contact, :cellfone, :home_page, :profile, :role, :email, :password, :password_confirmation, :remember_me
  
  has_and_belongs_to_many :courses
  has_many :matriculations, :dependent => :destroy 
  has_many :assets, :dependent => :destroy
  has_many :lessons, :dependent => :destroy
  has_many :alerts, :dependent => :destroy
  has_many :forums, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :tutors, :class_name => "Course", :foreign_key => "tutor_id"
  
  ROLES = %w[admin teacher student tutor]
  
  validates_presence_of :role, :name
  validates_inclusion_of :enabled, :in => [true, false]
  with_options :allow_blank => true do |c|
    c.validates_format_of :home_page,
                    :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  end
   
  #scope :admin, where(:role => ROLES[1])
  scope :teacher, where(:role => ROLES[1])
  scope :tutor, where(:role => ROLES[3])
  
  def teacher?
    self.role == ROLES[1]
  end
  
  def admin?
    self.role == ROLES[0]
  end
  
  def student?
    self.role == ROLES[2]  
  end
  
  def tutor?
    self.role == ROLES[3]
  end
  
  def password_invite(i)
    self.password, self.role = SecureRandom.hex(4), ROLES[i.to_i]
  end
    
protected
  def self.find_for_database_authentication(conditions)
    email = conditions.delete(:email)
    where(conditions).where(["enabled = true AND email = :value", { :value => email }]).first
  end
end
