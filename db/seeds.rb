# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jeremy = User.create(first_name: 'Jérémy', last_name: 'Kenigsman', email: 'jeremy.kenigsman@simplebo.fr', password_digest: 'qsdfghjklm')
kevin = User.create(first_name: 'Kévin', last_name: 'Khau', email: 'kkhau@hotmail.fr', password_digest: 'RubyOnRails')
julian = User.create(first_name: 'Julian', last_name: 'Bueno', email: 'julian@email.com', password_digest: 'Julian1')