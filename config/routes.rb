# For subdmain.
class SubdomainConstraint   
  def self.matches?(request)     
    request.subdomain.present? && request.subdomain != 'www'   
  end 
end 

Rails.application.routes.draw do

  resources :inventories do 
    get "delete"
  end
  
  resources :invoice_produit_items
  resources :invoice_food_items

   get "invoice/show/:uid" => "invoices#show",as: :show_invoice

  get "/invoice/cancel/:uid" => "invoices#get_cancel", as: :get_cancel_invoice
  post "/invoice/cancel/:uid" => "invoices#post_cancel", as: :post_cancel_invoice
  get "paynow-invoice/:uid" => "invoices#paynow", as: :paynow_invoice


  resources :invoices do
    
    get "delete"
    collection do    
      get "food" => "invoices#food"
      get "product" => "invoices#product"
      
    end
    
  end
  resources :quote_product_items
  resources :quote_items

  get "quote/show/:uid" => "quotes#show",as: :show_quote

  get "/quote/cancel/:uid" => "quotes#get_cancel", as: :get_cancel_quote
  post "/quote/cancel/:uid" => "quotes#post_cancel", as: :post_cancel_quote

  get "/stock-entry/cancel/:uid" => "stock_entries#get_cancel", as: :get_cancel_stock_entry
  post "/stock-entry/cancel/:uid" => "stock_entries#post_cancel", as: :post_cancel_stock_entry


  


  resources :quotes do
    
    get "delete"
    collection do    
      get "food" => "orders#food"
      get "product" => "orders#product"
      
    end
    
  end
  resources :gifts

  resources :unsold_foods, path: "unsold-foods" do 
    get "delete"
  end
  
  resources :technical_sheet_items do 
    get "delete"
  end

  resources :technical_sheets, path: "technical-sheets" do 
    get "delete"
  end

  get "features/send-sms" => "features#sms_send", as: :sms_send
  resources :customer_social_cases, path: "customer-social-cases" do   
    get "delete"
  end
  resources :time_units, path: "time-units" do   
    get "delete"
  end
  resources :notifications do   
    get "delete"
  end
  resources :partners do   
    get "delete"
  end
  
  resources :cart_items do   
    get "delete"
  end
  #resources :carts
  get "shop" => "foods#shop" , as: :shop
  get "foods/all" => "foods#all_foods", as: :all_foods

  get "add-to-cart" => "cart_items#add_to_cart", as: :add_to_cart
  get "cart" => "carts#show", as: :show_cart
  get "/cart-item/delete/:id" => "cart_items#delete", as: :delete_cart_item
  get "/cart-item/add/:id" => "carts#add_cart_item_food_quantity", as: :add_cart_item_food_quantity
  get "/cart-item/remove/:id" => "carts#remove_cart_item_food_quantity", as: :remove_cart_item_food_quantity
  get "/complete-order" => "orders#complete_order", as: :complete_order
  get "/order-complete-success" => "orders#order_complete_success", as: :order_complete_success
  get "/order-complete-error" => "orders#order_complete_error", as: :order_complete_error
 get "/food/:uid" => "foods#show", as: :food_show


  resources :customer_discounts, path: "customer-discounts" do   
    get "delete"
  end

  resources :activity_logs
  resources :order_item_drinks
  resources :drink_types
  get 'search/orders' => 'search#search_orders', as: :search_orders
  

  get 'ajaxsearch' => 'search#ajaxsearch', as: :ajaxsearch

  resources :tenants do   
    get "delete"
  end
  resources :api_keys
  get "orders/:uid/pdf" => "orders#generate_pdf", as: :generate_pdf
  get "orders/scan_card" => "orders#scan_card", as: :scan_card


  resources :tables , path: 'tables' do
    get "delete"
  end

  resources :stock_exits , path: 'stock-exits' do
    get "delete"
  end
  resources :stock_entries , path: 'stock-entries' do
    get "delete"
  end

  resources :food_categories, path: 'food-categories' do
    get "delete"
  end
  
  resources :recharge_fidelity_cards, path: 'recharge-fidelity-cards' do
    get "delete"
  end

  resources :customer_fidelity_cards, path: 'customer-fidelity-cards' do
    get "delete"
  end

  resources :fidelity_cards, path: 'fidelity-cards' do
    get "delete"
  end

  resources :unities do
    get "delete"
  end

 

  resources :products do
    get "delete"
  end

  resources :product_categories, path: 'product-categories' do
    get "delete"
  end

  resources :smtp_server_settings, path: 'smtp-server-settings' do
    get "delete"
  end

  resources :order_items do
    get "delete"
  end
get "orders/show/:uid" => "orders#show",as: :show_order
  

  resources :orders do
    
    get "delete"
    collection do    
      get "food" => "orders#food"
      get "product" => "orders#product"
      get "solde" => "orders#solde"
    end
    
  end

  get "/orders/cancel/:uid" => "orders#get_cancel", as: :get_cancel
  post "/orders/cancel/:uid" => "orders#post_cancel", as: :post_cancel


  get "paynow/:uid" => "orders#paynow", as: :paynow

  resources :foods do
    get "delete"
  end

  resources :providers do
    get "delete"
  end

  resources :customers do
    get "delete"
  end

  resources :users do
    get "delete"
  end
  
  resources :permission_items do
    get "delete"
  end

  resources :permissions do
    get "delete"
  end

  resources :features do
    get "delete"
  end

  resources :roles do
    get "delete"
  end
  
  #devise_for :accounts
  get "/dashboard" => "dashboard#index" , as: :dashboard
  get "/accounts"     => "custom_accounts#index", as: :all_accounts 

  #Customers accounts
  get "customers-accounts"     => "customer_accounts#index", as: :all_customer_accounts 

  post "/account/new"     => "custom_accounts#create", as: :create_account
  get "/account/new"     => "custom_accounts#new", as: :new_account
  get "/account/edit/:uid" => "custom_accounts#edit", as: :edit_account

  # Customer accounts
  get "customer/account/edit/:uid" => "customer_accounts#edit", as: :edit_customer_account

  patch "/account/update/:uid" => "custom_accounts#update", as: :udapte_account

  # Customer account.
  patch "customer/account/update/:uid" => "customer_accounts#update", as: :udapte_customer_account

	#get "/commissions/settings/new"     => "commission_settings#new", as: :new_commission_setting
	#get "/commissions/settings/edit/:id" => "commission_settings#edit", as: :edit_commission_setting

	delete "/account/destroy/:uid" => "custom_accounts#destroy", as: :destroy_account
	
	get "/account/delete/:uid" => "custom_accounts#delete", as: :delete_account


	get "/account/enable/:uid" => "custom_accounts#get_enable", as: :get_enable_account
	post "/user/enable/:uid" => "custom_accounts#post_enable", as: :post_enable_account

	get "/user/disable/:uid" => "custom_accounts#get_disable", as: :get_disable_account
	post "/user/disable/:uid" => "custom_accounts#post_disable", as: :post_disable_account

	get "/account/update/:uid" => "custom_accounts#update", as: :update_account

  # Customer account
  get "customer/account/update/:uid" => "customer_accounts#update", as: :update_customer_account


	get "/account/show/:uid" => "custom_accounts#show", as: :show_account

  get "utilities/backup" => "utilities#show_backup", as: :show_backup
  post 'utilities/backup' => "utilities#backup_database", as: :backup_database

	#get "/customers" => "customers#index", as: :customers_index
  
  devise_for :accounts, path: '', controllers: { 
    registrations: "accounts/registrations",
    confirmations: 'accounts/confirmations',
    passwords: "accounts/passwords",
    sessions: "accounts/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
    }
   
   # Home route.
  root to: "front#home"
  #root 'config_options#new'
  devise_scope :account do
    #root to: "accounts/sessions#new"
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'accounts/sessions#new', as: :unauthenticated_root
    end
  end

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  mount API::Base, at: "/"
  mount Ckeditor::Engine => '/ckeditor'
end
