# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: 'mlouie', password: 'password', about: 'gSchool Student')
Course.create(title: 'Modern Chinese History', day_night: true)
Course.create(title: 'Economics 101', day_night: false)
