# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create!(name: 'Tom', color: 'polka-dot', sex: 'M',description: 'He like Jerry', birth_date:'10-07-1992')
cat2 = Cat.create!(name: 'Sarah', color: 'black', sex: 'F', description: 'I am a real cat', birth_date: '20-01-1872')
cat3 = Cat.create!(name: 'Megan', color: 'white', sex: 'M', description:'I am not a real cat', birth_date: '12-12-1756')

# cat3 = Cat.create!(name: 'Megan', color: 'white', sex: 'M', description:'I am not a real cat', birth_date: '12-12-1756')
# cat3 = Cat.create!(name: 'Megan', color: 'white', sex: 'M', description:'I am not a real cat', birth_date: '12-12-1756')
