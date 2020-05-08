# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Dmitry', login: 'dmitry_1488', password: 'qwerty', email: 'asdasd@gmail')
sport = Category.create(title: 'Sport')
cars = Category.create(title: 'Cars')
it = Category.create(title: 'IT')

first_test = Test.create(title: 'Soccer', category_id: sport.id, author_id: user.id)
second_test = Test.create(title: 'Buscet', category_id: cars.id, author_id: user.id)
third_test = Test.create(title: 'Lada', category_id: cars.id, author_id: user.id)
fourth_test = Test.create(title: 'Ruby', category_id: it.id, author_id: user.id)
fifth_test = Test.create(title: 'PHP', category_id: it.id, author_id: user.id)

first_question = Question.create(body: 'Football in the usa', test_id: first_test.id)
second_question = Question.create(body: 'Where is Lada produced?', test_id: second_test.id)
third_question = Question.create(body: 'Best basketball player?', test_id: third_test.id)
fourth_question = Question.create(body: 'Who invented Ruby?', test_id: fourth_test.id)
fifth_question = Question.create(body: 'Who invented PHP?', test_id: fifth_test.id)

Answer.create(body: 'Soccer', correct: true, question_id: first_question.id)
Answer.create(body: 'Football', correct: false, question_id: first_question.id)
Answer.create(body: 'Tolyatti', correct: true, question_id: second_question.id)
Answer.create(body: 'Moscow', correct: false, question_id: second_question.id)
Answer.create(body: 'Shaquille Rashaun', correct: true, question_id: third_question.id)
Answer.create(body: 'Пушкин', correct: false, question_id: third_question.id)
Answer.create(body: 'Matz', correct: true, question_id: fourth_question.id)
Answer.create(body: 'Bill Gates', correct: false, question_id: fourth_question.id)
Answer.create(body: 'Rasmus Lerdorf', correct: true, question_id: fifth_question.id)
Answer.create(body: 'Brendan Eich', correct: false, question_id: fifth_question.id)
