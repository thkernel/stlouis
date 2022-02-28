class ApplicationController < ActionController::Base
	before_action :store_user_location!, if: :storable_location?
    before_action :set_shopping_cart

	after_action :current_tenant


	def current_ability
	  # instead of Ability.new(current_user)
	  @current_ability ||= Ability.new(current_account)
	end


	def current_tenant
		puts "CURRENT TENANT : #{Apartment::Tenant.current}"
	end

	private
    def set_shopping_cart
       
        if session[:shopping_cart].present?
            puts "CURRENT SHOPING CART: #{session[:shopping_cart]["id"]}"
            @shopping_cart = Cart.find(session[:shopping_cart]["id"])
            puts "EXISTING SHOPING CART"
        else
            @shopping_cart = Cart.create
            session[:shopping_cart] = @shopping_cart
            puts "NEW SHOPPING CART"
        end
    rescue
      session.delete(:shopping_cart)
      @shopping_cart = Cart.create
      session[:shopping_cart] = @shopping_cart
      #puts "IN RESCUE"
    end

   
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
    end



end
