# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Dmitry', login: 'dmitry_1488', password: 'qwerty')
sport = Category.create(title: 'Sport')
cars = Category.create(title: 'Cars')
it = Category.create(title: 'IT')

first_test = Test.create(title: 'Soccer', categories_id: sport.id)
second_test = Test.create(title: 'Buscet', categories_id: cars.id)
third_test = Test.create(title: 'Lada', categories_id: cars.id)
fourth_test = Test.create(title: 'Ruby', categories_id: it.id)
fifth_test = Test.create(title: 'PHP', categories_id: it.id)

first_question = Question.create(body: 'Football in the usa', tests_id: first_test.id)
second_question = Question.create(body: 'Where is Lada produced?', tests_id: second_test.id)
third_question = Question.create(body: 'Best basketball player?', tests_id: third_test.id)
fourth_question = Question.create(body: 'Who invented Ruby?', tests_id: fourth_test.id)
fifth_question = Question.create(body: 'Who invented PHP?', tests_id: fifth_test.id)

Answer.create(body: 'Soccer', correct: true, questions_id: first_question.id)
Answer.create(body: 'Football', correct: false, questions_id: first_question.id)
Answer.create(body: 'Tolyatti', correct: true, questions_id: second_question.id)
Answer.create(body: 'Moscow', correct: false, questions_id: second_question.id)
Answer.create(body: 'Shaquille Rashaun', correct: true, questions_id: third_question.id)
Answer.create(body: 'Пушкин', correct: false, questions_id: third_question.id)
Answer.create(body: 'Matz', correct: true, questions_id: fourth_question.id)
Answer.create(body: 'Bill Gates', correct: false, questions_id: fourth_question.id)
Answer.create(body: 'Rasmus Lerdorf', correct: true, questions_id: fifth_question.id)
Answer.create(body: 'Brendan Eich', correct: false, questions_id: fifth_question.id)