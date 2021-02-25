# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jeremy = User.create(first_name: 'Jérémy', last_name: 'Kenigsman', email: 'jeremy.kenigsman@simplebo.fr', password: 'qsdfghjklm')
kevin = User.create(first_name: 'Kévin', last_name: 'Khau', email: 'kkhau@hotmail.fr', password: 'RubyOnRails')
julian = User.create(first_name: 'Julian', last_name: 'Bueno', email: 'julian@email.com', password: 'Julian1')

simplebo = Ticket.create(title: "Simplébo", description: "Agence Web", status: "open", user_id: jeremy.id)
Ticket.create(title: "Other", description: "Plus cher, plus vieux", status: "closed", user_id: julian.id)
Ticket.create(title: "Rails", description: "Framework Ruby full stack", status: "open", user_id: kevin.id)
Ticket.create(title: "Angular", description: "Framework front TypeScript orienté controller", status: "closed", user_id: kevin.id)
Ticket.create(title: "ReactJS", description: "Framework front orienté génération HTML", status: "open", user_id: kevin.id)

Comment.create(content: "Welcome! I'm the CTO, I'm in charge of this ticket.", ticket_id: simplebo.id, user_id: jeremy.id)
Comment.create(content: "Nice to meet you.", ticket_id: simplebo.id, user_id: kevin.id)
Comment.create(content: "Ready to help people and improve the world?", ticket_id: simplebo.id, user_id: jeremy.id)
Comment.create(content: "Yeah, let's ruby-shine.", ticket_id: simplebo.id, user_id: kevin.id)