json.extract! permission_item, :id, :uid, :permission_id, :action_name, :status, :created_at, :updated_at
json.url permission_item_url(permission_item, format: :json)
