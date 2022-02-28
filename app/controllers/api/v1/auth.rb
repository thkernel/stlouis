module API
    module V1
      class Auth < Grape::API
        include API::V1::Defaults
       

        resource :auth do

            desc "Creates and returns access_token if valid login"
            params do
              requires :email, type: String, desc: "Accountname or email address"
              requires :password, type: String, desc: "Password"
            end

            post :login do
=begin
              if params[:login].include?("@")
                Account = Account.find_by_email(params[:login].downcase)
              else
                Account = Account.find_by_login(params[:login].downcase)
              end
          
              if Account && Account.authenticate(params[:password])
                key = ApiKey.create(Account_id: Account.id)
                {token: key.access_token}
              else
                error!('Unauthorized.', 401)
              end
=end

                email = params[:email].strip if params[:email].present?
                password = params[:password]

                if email.nil? or password.nil?
                    error!({error_code: 404, error_message: "Invalid Email or Password."},401)
                    return
                end

                account = Account.where(email: email.downcase).first
                if account.nil?
                    error!({error_code: 404, error_message: "Invalid Email."},401)
                    return
                end

                if !account.valid_password?(password)
                    error!({error_code: 404, error_message: "Invalid Password."},401)
                    return
                else
                    #Account.ensure_authentication_token!
                    #Account.friendly_token()
                    #Account.save
                    puts "account_ID: #{account.id}"
                    api_key = ApiKey.where("account_id = ? AND active =?",  account.id, true).first
                    
                    puts "API KEY: #{api_key}"
                    if api_key.present?
                      {status: 'ok', token: api_key.access_token}#.to_json
                    else
                      key = ApiKey.create(account_id: account.id)
                      #{token: key.access_token}
                      {status: 'ok', token: key.access_token}#.to_json
                    end
                end
            end
          
            desc "Returns pong if logged in correctly"
            params do
              requires :token, type: String, desc: "Access token."
            end
            get :ping do
              authenticate!
              { message: "pong" }
            end
          end

      end
    end
end