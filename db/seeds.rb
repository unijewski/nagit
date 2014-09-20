# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Nagger.delete_all
Complaint.delete_all


(1..5).each do |number|
  Nagger.create( email: "joe.doe#{number}@example.com", password: "test1234", password_confirmation: "test1234")
end

(1..20).each do |number|
  hate = Complaint.create(name: "Hate#{number}",
                         content: "Hate everything #{number}",
                         url: Faker::Internet.url('example.com'))
  Nagger.all.sample.complaints << hate
end
