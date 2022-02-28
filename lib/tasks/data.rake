namespace :data do
  desc "Load default data"
  task default_data: :environment do

  	# Roles

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
	        
	    
	    ])

	else

	     accounts = Account.all
	end


	

  end

end
