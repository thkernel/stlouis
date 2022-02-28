class CartController < ApplicationController
    include ShoppingCart
    
    def add_to_cart
        
        product = Product.find(params[:product])
        
        cart = ShoppingCart::Cart.instance()
        cart.add_to_cart(product)
        puts "CART #{cart.inspect}"
       
       

        puts "SESSION CART: #{cart.session.inspect}"
    end
end