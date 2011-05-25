# (en)coding: utf-8.
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

TextDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eros dolor, lacinia non pharetra nec, pharetra non tortor. Sed vel urna libero, sit amet fringilla dolor. Nullam ut metus non urna consectetur luctus. Phasellus ac elit elit. Maecenas tempus rutrum orci ac varius. Sed vel neque mi, et adipiscing enim. Sed viverra condimentum purus vel congue. Curabitur et gravida turpis. Cras id porttitor arcu. Aenean enim mi, sollicitudin ut euismod in, aliquam adipiscing turpis. Ut interdum felis eget elit vestibulum nec aliquet ipsum iaculis. Vestibulum mi leo, mattis quis luctus non, interdum at urna. Integer mauris lacus, pharetra a pellentesque in, facilisis non augue. Aenean nec mauris ac lorem aliquet sollicitudin. Nulla tempor pulvinar urna, sed congue risus tincidunt et."

admin = User.create!(:name => "Administrador", :contact => "(31)9999-9999", :email => "admin@te-ensino.com", :password => "sistema", :role => User::ROLES[0])
print "#{admin.name} criado com sucesso...\n"

teacher1 = User.create!(:name => "Marcio Assis", :contact => "(33)3333-3333", :email => "assismiranda@gmail.com", :password => "1234567", :role => User::ROLES[1])
print "#{teacher1.name} criado com sucesso...\n"

teacher2 = User.create(:name => "Reinaldo", :contact => "(31)8787-9898", :email => "reinaldo.opus@gmail.com", :password => "1234567", :role => User::ROLES[1])
print "#{teacher2.name} criado com sucesso...\n"

teacher = User.create!(:name => "Thauan", :contact => "(31)9903-0777", :email => "thauanz@gmail.com", :password => "thauan", :role => User::ROLES[1])
print "#{teacher.name} criado com sucesso...\n"

teacher = User.create!(:name => "Maria Tereza", :contact => "(31)9903-0777", :email => "tete@gmail.com", :password => "thauan", :role => User::ROLES[1])
print "#{teacher.name} criado com sucesso...\n"

tutor = User.create(:name => "Jessica", :contact => "(31)8787-9898", :email => "jessica@gmail.com", :password => "thauan", :role => User::ROLES[3])
print "#{tutor.name} criado com sucesso...\n"

tutor1 = User.create(:name => "Luiza", :contact => "(31)8787-9898", :email => "luiza@gmail.com", :password => "thauan", :role => User::ROLES[3])
print "#{tutor1.name} criado com sucesso...\n"

1.upto 4 do |i|
  hash_course = {1 => "Sistema de informação", 2 => "IA", 3 => ".NET", 4 => "TDD"}
  Course.create!(
  :name         => hash_course[i],
  :description  => TextDescription,
  :enabled      => true,
  :price        => 399.to_f,
  :workload     => "60",
  :amount       => 60.to_i,
  :tutor_id     => User.where(:role => "tutor").offset(rand(2)).first.id,
  :users        => [User.where(:role => "teacher").offset(rand(4)).first]
  )
  print "Curso de #{hash_course[i]} criado com sucesso...\n"
end

1.upto 90 do |i|
  User.create!(
    :name => "User #{i}", 
    :contact => "(31)9903-0777", 
    :email => "user#{i}@gmail.com", 
    :password => "1234567", 
    :role => User::ROLES[2],
    :profile => TextDescription,
    :home_page => "http://www.google.com"
  )
 
  print "Aluno #{i} criado \n"
end

1.upto 90 do |i|
  Matriculation.create!(
    :user => User.where(:role => "student", :id => (i+7)).first,
    :course => Course.find(rand(3).zero? ? 1 : rand(3)+1),
    :enabled => false
  )
  print "Aluno #{i} matriculado no curso de #{Matriculation.last.course.name}\n"
end

1.upto 50 do |i|
    course = Course.find(rand(3).zero? ? 1 : rand(3)+1)
  Alert.create!(
    :title => "Aviso #{i}",
    :expire => Date.today + i,
    :description => TextDescription,
    :user => course.users.last,
    :course => course
  )
  print "Alerta #{i} criado com sucesso...\n"
end

1.upto 50 do |i|
  course = Course.find(rand(3).zero? ? 1 : rand(3)+1)
  Lesson.create!(
  :theme => "Lição #{i}",
  :date_at => Date.today + i,
  :description => TextDescription,
  :user => course.users.last,
  :course => course,
  :enabled => false
  )
  print "Lição #{i} criado com sucesso...\n"
end

