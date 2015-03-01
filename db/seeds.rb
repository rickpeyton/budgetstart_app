# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Frequency.create([
  { name: 'Every other month', value: 6 },
  { name: 'Yearly', value: 1 },
  { name: 'Every 3 months', value: 4 },
  { name: 'Every 4 months', value: 3 },
  { name: 'Twice a year', value: 2 },
  { name: 'Monthly', value: 12 },
  { name: 'Every other year', value: 0.5 },
  { name: 'Every three years', value: 0.3333333333 }
])
