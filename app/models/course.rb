class Course < ActiveRecord::Base
  has_many :matriculations, :dependent => :destroy
  has_many :alerts
  has_and_belongs_to_many :users  #professor
  has_many :lessons, :dependent => :destroy
  
  validates_presence_of :name, :description, :price, :users
  validates_uniqueness_of :name
  #validate :teacher_matriculation
  
  scope :activated, where(:enabled => true)
  
  scope :search, lambda { |terms| 
    where("name LIKE :t OR description LIKE :t OR price LIKE :t OR workload LIKE :t", :t => "%#{terms}%")
  }
  
private
  #verifica se o professor ja é aluno do curso, para que ele não seja incluido como professor do mesmo curso.
  def teacher_matriculation
    self.matriculations.each do |user_matriculation|
      self.users.each do |teacher|
        errors.add(:user, I18n.t(:cannot_teacher_matriculation)) if teacher.teacher? && user_matriculation.id == teacher.id
      end
    end
  end
end
