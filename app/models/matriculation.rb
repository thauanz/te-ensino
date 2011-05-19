class Matriculation < ActiveRecord::Base
  default_scope order(:course_id, :user_id)
  belongs_to :user
  belongs_to :course
  
  validates_presence_of :user_id, :course_id
  validates_uniqueness_of :course_id, :scope => :user_id
  validate :amount_course_students
  
  def name_with
    user.name
  end
  
  def teachers
    self.course.users.collect {|user| "#{user.name} (#{user.email})" }.join("<br/>").html_safe
  end
  
  def tutor
    User.where(:id => self.course.tutor_id).collect {|user| "#{user.name} (#{user.email})" }.join("<br/>").html_safe
  end
  
private
  def amount_course_students
    _course = Course.find_by_id(self.course_id.to_i)
    errors.add(:course_id, I18n.t(:vacancies_exhausted)) if !_course.nil? && ((Matriculation.where(:course_id => self.course_id.to_i).count + 1) > _course.amount.to_i)
  end
  
end
