# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

categories = Category.create!([{
  title: "Ruby"
},
{
  title: "Ruby on Rails"
},
{
  title: "Python"
}])

p "created #{Category.count} categories"

Test.destroy_all

tests = Test.create!([{
  title: "About the language",
  level: 1,
  category_id: categories[0],
  created_at: Time.now,
  updated_at: Time.now
},
{
  title: "Properties of the language",
  level: 2,
  category_id: categories[1],
  created_at: Time.now,
  updated_at: Time.now
},
{
  title: "Usage the language",
  level: 2,
  category_id: categories[2],
  created_at: Time.now,
  updated_at: Time.now
}])

p "created #{Test.count} tests"

Question.destroy_all

questions = Question.create!([{
  body: "Who is the creator of the language?",
  test_id: tests[0],
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "When was the language created?",
  test_id: tests[0],
  created_at: Time.now,
  updated_at: Time.now 
},
{
  body: "Is this language dynamic?",
  test_id: tests[1],
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "Are there any differences from another languages?",
  test_id: tests[1],
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "In what areas the language is used?",
  test_id: tests[2],
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "Are there any disadvantages?",
  test_id: tests[2],
  created_at: Time.now,
  updated_at: Time.now
}])

p "created #{Question.count} questions"

Answer.destroy_all

answers = Answer.create!([{
  body: "Matz",
  question_id: questions[0],
  correct: 1,
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "1995",
  question_id: questions[1],
  correct: 1,
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "yes",
  question_id: questions[2],
  correct: 1,
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "yes",
  question_id: questions[3],
  correct: 1,
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "science, web development",
  question_id: questions[4],
  correct: 1,
  created_at: Time.now,
  updated_at: Time.now
},
{
  body: "no",
  question_id: questions[5],
  correct: 1,
  created_at: Time.now,
  updated_at: Time.now
  }])

p "created #{Answer.count} answers"

User.destroy_all

users = User.create!([{
  name: "Ivan Ivanov",
  created_at: Time.now,
  updated_at: Time.now
},
{
  name: "Petr Petrov",
  created_at: Time.now,
  updated_at: Time.now
}])

p "created #{User.count} users"

TestUser.destroy_all

test_users = TestUser.create!([
  {user_id: users[0].id, test_id: tests[0]},
  {user_id: users[1].id, test_id: tests[1]}
])

p "created #{TestUser.count} dependents"


