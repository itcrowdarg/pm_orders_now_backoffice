module Api
  module V1
    module Jsons
      module NormalUserToken
        extend ActiveSupport::Concern

        included do
          def as_json(args: {}, current_user: nil)
            decorated = decorate
            {
              id: decorated.id,
              access_token: decorated.access_token,
              refresh_token: decorated.refresh_token,
              datetime_expiration: decorated.datetime_expiration.to_s,
              created_at: decorated.created_at.to_s,
              updated_at: decorated.updated_at.to_s
            }
          end
        end
      end
    end
  end
end
