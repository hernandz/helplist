# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Subject.create(name: 'Physics 41')
Subject.create(name: 'CS 147')
Subject.create(name: 'MATH 51')
Subject.create(name: 'CME 100')
Lecture.create()
Lecture.create()
Lecture.create()
Lecture.create()
Question.create(text: 'F=ma?', upvotes: 52, lecture_id: 1)
Answer.create(text: 'Read the book', upvotes: 15, question_id: 1)
Answer.create(text: 'Force = mass * accel ', upvotes: 9, question_id: 1)
Answer.create(text: 'Think about Newton', upvotes: 3, question_id: 1)
Answer.create(text: 'Food = money * appetite', upvotes: 0, question_id: 1)
