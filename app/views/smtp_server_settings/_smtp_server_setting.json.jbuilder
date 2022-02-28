json.extract! smtp_server_setting, :id, :uid, :host_name, :user_name, :user_password, :domain, :port, :authentication, :enable_starttls_auto, :ssl, :account_id, :created_at, :updated_at
json.url smtp_server_setting_url(smtp_server_setting, format: :json)
