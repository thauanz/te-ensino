# (en)coding: utf-8.
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

TextDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eros dolor, lacinia non pharetra nec, pharetra non tortor. Sed vel urna libero, sit amet fringilla dolor. Nullam ut metus non urna consectetur luctus. Phasellus ac elit elit. Maecenas tempus rutrum orci ac varius. Sed vel neque mi, et adipiscing enim. Sed viverra condimentum purus vel congue. Curabitur et gravida turpis. Cras id porttitor arcu. Aenean enim mi, sollicitudin ut euismod in, aliquam adipiscing turpis. Ut interdum felis eget elit vestibulum nec aliquet ipsum iaculis. Vestibulum mi leo, mattis quis luctus non, interdum at urna. Integer mauris lacus, pharetra a pellentesque in, facilisis non augue. Aenean nec mauris ac lorem aliquet sollicitudin. Nulla tempor pulvinar urna, sed congue risus tincidunt et."

admin = User.create!(:name => "Admin", :contact => "(31)9999-9999", :email => "admin@gmail.com", :password => "sistema", :role => User::ROLES[0])
print "#{admin.name} criado com sucesso...\n"

teacher1 = User.create!(:name => "Marcio Assis", :contact => "(33)3333-3333", :email => "assismiranda@gmail.com", :password => "1234567", :role => User::ROLES[1])
print "#{teacher1.name} criado com sucesso...\n"

teacher2 = User.create(:name => "Reinaldo", :contact => "(31)8787-9898", :email => "reinaldo.opus@gmail.com", :password => "1234567", :role => User::ROLES[1])
print "#{teacher2.name} criado com sucesso...\n"

teacher = User.create!(:name => "Thauan", :contact => "(31)9903-0777", :email => "thauanz@gmail.com", :password => "thauan", :role => User::ROLES[1])
print "#{teacher.name} criado com sucesso...\n"

teacher = User.create!(:name => "Maria Tereza", :contact => "(31)9903-0777", :email => "tete@gmail.com", :password => "thauan", :role => User::ROLES[1])
print "#{teacher.name} criado com sucesso...\n"

student = User.create(:name => "Jessica", :contact => "(31)8787-9898", :email => "jessica@gmail.com", :password => "thauan", :role => User::ROLES[2])
print "#{student.name} criado com sucesso...\n"

1.upto 4 do |i|
  hash_course = {1 => "Sistema de informação", 2 => "IA", 3 => ".NET", 4 => "TDD"}
  Course.create!(
  :name         => hash_course[i],
  :description  => TextDescription,
  :enabled      => true,
  :price        => 399.to_i,
  :amount       => 60.to_i,
  :users        => [User.where(:role => "teacher", :id => (i+1)).first]
  )
  print "Curso de #{hash_course[i]} criado com sucesso...\n"
end

1.upto 100 do |i|
  User.create!(
    :name => "User #{i}", 
    :contact => "(31)9903-0777", 
    :email => "user#{i}@gmail.com", 
    :password => "1234567", 
    :role => User::ROLES[2]
  )
    
  Matriculation.create!(
    :user => User.last,
    :course => Course.find(rand(Course.count).zero? ? 1 : rand(Course.count)+1),
    :enabled => false
  )
  print "Aluno #{User.last.name} matriculado no curso de #{Matriculation.last.course.name}\n"
end

1.upto 50 do |i|
    user = User.find(rand(User.where(:role => "teacher").count).zero? ? 2 : rand(User.where(:role => "teacher").count)+2 )
  Alert.create!(
    :title => "Aviso #{i}",
    :expire => Date.today + i,
    :description => TextDescription,
    :user => user,
    :course => user.courses.last
  )
  print "Alerta #{i} criado com sucesso...\n"
end

1.upto 50 do |i|
  user = User.find(rand(User.where(:role => "teacher").count).zero? ? 2 : rand(User.where(:role => "teacher").count)+2 )
  Lesson.create!(
  :theme => "Lição #{i}",
  :date_at => Date.today + i,
  :description => TextDescription,
  :user => user,
  :course => user.courses.last
  )
  #Course.find(rand(Course.count).zero? ? 1 : rand(Course.count)+1)
  print "Lição #{i} criado com sucesso...\n"
end

