class CustomAccountsController < ApplicationController
	#authorize_resource
		before_action :authenticate_account!
		layout "dashboard"

        before_action :set_account, only: [:show, :edit, :update, :destroy] # probably want to keep using this
    
    

    
		def new
		
		
			
			@roles = Role.where.not(name: "Superuser")
		
			
			@account = Account.new
			#@account.build_accountable
		end

		

		
		def create
			
		@account = Account.new(account_params)
		#@account.created_by = current_account.id

			respond_to do |format|
				if @account.save
					#@account.build_profile
					@accounts = Account.where.not(id: current_account.id)
					#record_activity("Créer un nouvel utilisateur (ID: #{@account.id})")

					format.html { redirect_to all_accounts_path, notice: 'Enregistrer avec succès.' }
					format.json { render :show, status: :created, location: @contributor }
					format.js
		

			
			
				else
					format.html { render :new }
					format.json { render json: @account.errors, status: :unprocessable_entity }
					format.js
				end
			end
		end
		
		def create_admin
		end

	# Index
    def index
    	
			@accounts = Account.where.not(id: current_account.id).order(id: "desc")
		
			#record_activity("Afficher la liste des utilisateurs.")

    end
    
    def unregistered
     
    end
	
    # GET /accounts/1
    # GET /accounts/1.json
	def show
		
    end

    # GET /accounts/1/edit
		def edit
			
			
			@roles = Role.where.not(name: "Superuser")
			#@account.profile || @account.build_profile 
    end

    def delete
    	@account = Account.find_by(uid: params[:uid])
    end

    def get_disable
        @account = Account.find(params[:id]) if params[:id].present?
     
	end
	
    def post_disable
	  	@account = account.find(params[:id]) if params[:id].present?
	  
      	respond_to do |format|
        	if @account.update_attributes(status: 'disable')
						@accounts = account.where.not(id: current_account.id)
						record_activity("Désactiver le compte d'un utilisateur (ID: #{@account.id})")

				format.html { redirect_to @account, notice: 'account was successfully updated.' }
				format.json { render :show, status: :ok, location: @account }
				format.js
        
				# Send mail to account.
				#url = account_session_url
				#accountMailer.disable_account_mail(@account.email, @account.password, url).deliver_now
			else
				format.html { render :edit }
				format.json { render json: @account.errors, status: :unprocessable_entity }
				format.js
			end
		end
   
    end

    def get_enable
    	@account = Account.find(params[:id]) if params[:id].present?
   
	end
	
	# Enable account account.
  	def post_enable
		@account = account.find(params[:id]) if params[:id].present?
		respond_to do |format|
      		if @account.update_attributes(status: 'enable')
						@accounts = account.where.not(id: current_account.id)
						record_activity("Activer le compte d'un utilisateur (ID: #{@account.id})")

				format.html { redirect_to @account, notice: 'account was successfully updated.' }
				format.json { render :show, status: :ok, location: @account }
				format.js
      
				

				Thread.new do
					Rails.application.executor.wrap do
					  # your code here
					end
				end
			  
			else
				format.html { render :edit }
				format.json { render json: @account.errors, status: :unprocessable_entity }
				format.js
			end
      	end
 
  	end

    

	def destroy
    	@accounts = Account.all
    
    	if @account.destroy
			@accounts = Account.where.not(id: current_account.id)
        	#record_activity("Supprimer un utilisateur (ID: #{@account.id})")

			respond_to do |format|
				format.html { redirect_to all_accounts_path, notice: "L'utilisateur a été supprimer avec succès!" }
				format.json { head :no_content }
				format.js

			end
		end

 	end

   	

    # # PATCH/PUT /accounts/1
    # # PATCH/PUT /accounts/1.json
    def update
		respond_to do |format|
			
			if params[:account][:password].blank? #&& params[:account][:password_confirmation].blank?
				params[:account].delete(:password)
				params[:account].delete(:password_confirmation)
			end

			if @account.update(account_params)
				@accounts = Account.where.not(id: current_account.id)
        #record_activity("Modifier un utilisateur (ID: #{@account.id})")

				format.html { redirect_to all_accounts_path, notice: 'Modifier avec succès.' }
				format.json { render :show, status: :ok, location: @account }
				format.js
			

	
				  
				
			else
				format.html { render :edit }
				format.json { render json: @account.errors, status: :unprocessable_entity }
				format.js
			end
      	end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
    	puts "PARAMS: #{params.inspect}"
    	@account = Account.find_by(uid: params[:uid])
      
      	puts "ACCOUNT ON SET: #{@account.inspect}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:login, :email, :password,:password_confirmation, :role_id,  user_attributes: [:first_name, :last_name ])
    end

end