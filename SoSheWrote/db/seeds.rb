# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = Category.create([
  {name: 'Code'},
  {name: 'Creative'},
  {name: 'Test'}
  ])

article = Article.create([
  { title: 'typography', content: 'this is an article about typography', published: false },
  { title: 'poem', content: 'This is a poem', published: false},
  { title: 'test', content: 'Testing, Testing, 1 2 3 ', published: false}
])

tag = Tag.create([
  { name: 'CSS'},
  { name: 'Frontend'},
  { name: 'Poetry'},
  { name: 'Test'}
])