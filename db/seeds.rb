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
  category_id: categories[0].id
},
{
  title: "Properties of the language",
  level: 2,
  category_id: categories[1].id
},
{
  title: "Usage the language",
  level: 2,
  category_id: categories[2].id
}])

p "created #{Test.count} tests"

Question.destroy_all

questions = Question.create!([{
  body: "Who is the creator of the language?",
  test_id: tests[0].id
},
{
  body: "When was the language created?",
  test_id: tests[0].id
},
{
  body: "Is this language dynamic?",
  test_id: tests[1].id
},
{
  body: "Are there any differences from another languages?",
  test_id: tests[1].id
},
{
  body: "In what areas the language is used?",
  test_id: tests[2].id
},
{
  body: "Are there any disadvantages?",
  test_id: tests[2].id
}])

p "created #{Question.count} questions"

Answer.destroy_all

answers = Answer.create!([{
  body: "Matz",
  question_id: questions[0].id,
  correct: true
},
{
  body: "1995",
  question_id: questions[1].id,
  correct: true
},
{
  body: "yes",
  question_id: questions[2].id,
  correct: true
},
{
  body: "yes",
  question_id: questions[3].id,
  correct: true
},
{
  body: "science, web development",
  question_id: questions[4].id,
  correct: true
},
{
  body: "no",
  question_id: questions[5].id,
  correct: true
  }])

p "created #{Answer.count} answers"

User.destroy_all

users = User.create!([{
  name: "Ivan Ivanov"
},
{
  name: "Petr Petrov"
}])

p "created #{User.count} users"

TestUser.destroy_all

test_users = TestUser.create!([
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[1].id, test_id: tests[1].id}
])

p "created #{TestUser.count} dependents"