# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback

unless Role.all.present?
    roles = Role.create(
        [
            {name: "Superuser"},
            {name: "Administrateur"},
            {name: "Superviseur"},
            {name: "Gérant"},
            {name: "Caissier"},
            {name: "Serveur"},
            {name: "Livreur"},
            {name: "Client"},

            
            
        ])
else
    roles = Role.all

end


#User
unless User.all.present?
users = User.create([
    {
        first_name: "Amos", 
        last_name: "DEMBELE",
        #role_id: Role.find_by(name: "superuser").id
    },
    {
        first_name: "Admin", 
        last_name: "Admin",
        #role_id: Role.find_by(name: "Administrateur").id
    },
    {
        first_name: "Momo", 
        last_name: "THIAM",
        #role_id: Role.find_by(name: "superuser").id
    }
])
else
    users = User.all
end


# Account
unless Account.all.present?

    accounts = Account.create([
        {accountable: users[0], login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "Superuser").id},
        {accountable: users[1],login: "admin", email: "teledocplus@gmail.com", password: "Root@2021@#!*", password_confirmation: "Root@2021@#!*", role_id:  Role.find_by(name: "Administrateur").id},
        {accountable: users[2],login: "kolane",  email: "kolanefrederic@gmail.com",  password: "Root@2021@#!*", password_confirmation: "Root@2021@#!*", role_id:  Role.find_by(name: "Caissier").id}
    
    ])

else

     accounts = Account.all
end


