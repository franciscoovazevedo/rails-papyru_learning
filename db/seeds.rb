# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def random_numbers
  phone_number = "9"
  8.times do
    phone_number += rand(0..9).to_s
  end
  phone_number
end

# Already created
10.times do
  user = User.new(name: Faker::HarryPotter.character, email:  Faker::HarryPotter.character.delete(' ') +
   "@hogwarts.com", phone_number: random_numbers, teacher: [true, false].sample, password: "123456", address: Faker::GameOfThrones.city  )
  user.remote_photo_url = "https://randomuser.me/api/portraits/men/#{rand(0..99)}.jpg"
  user.save
end

# # Already created
10.times do
  subject = Subject.new(name: Faker::Book.genre)
  subject.save
end

#Already done
User.all.each do |user|
  Review.create(rating: rand(1..10), content: Faker::Hipster.paragraph, user: user)
  TeacherSubject.create(begin: Faker::Date.forward, end: Faker::Date.forward, price: rand(10..50), description: Faker::Hipster.paragraphs + Faker::Hipster.paragraphs , user: user, subject: Subject.all.sample)
  Lesson.create(date: Faker::Date.forward, user: user, teacher_subject: TeacherSubject.all.sample)
  Profile.create(user: user)
end
puts "WORKED!!!!!!!!!"

# # Already done
# User.all.each do |user|
#   TeacherSubject.create(begin: Faker::Date.forward, end: Faker::Date.forward, price: rand(10..50), description: Faker::Hipster.paragraphs + Faker::Hipster.paragraphs , user: user, subject: Subject.all.sample)
# end

# # Already done
# User.all.each do |user|
#   Lesson.create(date: Faker::Date.forward, user: user, teacher_subject: TeacherSubject.all.sample)
# end








