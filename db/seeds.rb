# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

admin = User.create(:name => "Admin", :contact => "(31)9999-9999", :email => "admin@gmail.com", :password => "sistema", :role => User::ROLES[0])
print "#{admin.name} criado com sucesso...\n"

teacher = User.create(:name => "Thauan", :contact => "(31)9903-0777", :email => "thauanz@gmail.com", :password => "thauan", :role => User::ROLES[1])
print "#{teacher.name} criado com sucesso...\n"

course = Course.new(:name => "Sistema de informacao", :description => "Lorem Ipsum is simply dummy. Lorem Ipsum is simply dummy.", :enabled => true, :price => "399", :amount => 30.to_i)
course.users << teacher
course.save
print "Curso de #{course.name} criado com sucesso...\n"

teacher1 = User.create(:name => "Marcio Assis", :contact => "(33)3333-3333", :email => "assismiranda@gmail.com", :password => "1234567", :role => User::ROLES[1])
print "#{teacher1.name} criado com sucesso...\n"
