# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

users = User.create([{
	name: 'Ivan Ivanov',
  created_at: Time.now,
  updated_at: Time.now
},
{
  name: 'Petr Petrov',
  created_at: Time.now,
  updated_at: Time.now
}])

p "created #{User.count} users"

Category.destroy_all

categories = Category.create!([{
	title: "Ruby",
	created_at: Time.now,
	updated_at: Time.now
},
{
	title: "Ruby on Rails",
	created_at: Time.now,
	updated_at: Time.now
},
{
	title: "Python",
	created_at: Time.now,
	updated_at: Time.now

}])

p "created #{Category.count} categories"

Test.destroy_all

tests = Test.create!([{
	title: "About the authors",
	level: 0,
	category_id: Category.find_by(title: 'Ruby').id,
	user_id: User.find_by(name: 'Ivan Ivanov').id,
	created_at: Time.now,
	updated_at: Time.now
},
{
	title: "Application area",
	level: 1,
	category_id: Category.find_by(title: 'Ruby on Rails').id,
	user_id: User.find_by(name: 'Petr Petrov').id,
	created_at: Time.now,
	updated_at: Time.now
},
{
	title: "Abvantages of the language",
	level: 1,
	category_id: Category.find_by(title: 'Python').id,
	created_at: Time.now,
	updated_at: Time.now

}])

p "created #{Test.count} tests"

Question.destroy_all

questions = Question.create([{
	body: "Who is the creater of the Ruby language?",
	test_id: Test.find_by(title: 'About the authors').id,
	created_at: Time.now,
	updated_at: Time.now
},
{
	body: "What are the advantages of the language?",
	test_id: Test.find_by(title: 'Abvantages of the language').id,
	created_at: Time.now,
	updated_at: Time.now
}
])

p "created #{Question.count} questions"

Answer.destroy_all

answers = Answer.create([{
	body: 'Yukihiro Matsumoto',
	question_id: Question.find_by(body: 'What are the advantages of the language?').id,
	correct: true,
  created_at: Time.now,
  updated_at: Time.now
},
{
	body: 'Development speed',
	question_id: Question.find_by(body: 'Who is the creater of the Ruby language?').id,
	correct: true,
  created_at: Time.now,
  updated_at: Time.now
}])

p "created #{Answer.count} answers"
