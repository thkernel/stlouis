module SidebarMenusHelper

    def sidebar_menu 
        if current_account.role.name == "Superuser"
            render "layouts/partials/dashboard/navs/superuser-nav"
        elsif current_account.role.name == "Administrateur" 
			render "layouts/partials/dashboard/navs/administrateur-nav" 

		elsif current_account.role.name == "Superviseur" 
			render "layouts/partials/dashboard/navs/superviseur-nav" 
		elsif current_account.role.name == "Gérant" 
			render "layouts/partials/dashboard/navs/gerant-nav" 
	    elsif current_account.role.name == "Caissier" 
			render "layouts/partials/dashboard/navs/caissier-nav"
	    elsif current_account.role.name == "Serveur" 
			render "layouts/partials/dashboard/navs/serveur-nav" 
	    elsif current_account.role.name == "Livreur" 
	    	render "layouts/partials/dashboard/navs/livreur-nav" 
	    elsif current_account.role.name == "Client" 
	    	render "layouts/partials/dashboard/navs/client-nav" 
        end
    end

end