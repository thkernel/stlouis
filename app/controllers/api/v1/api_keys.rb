module API
    module V1
      class ApiKeys < Grape::API
        include API::V1::Defaults
        resource :api_keys do
          desc "Return all api keys"
          get "" do
            ApiKey.all
          end

          desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            ApiKey.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end