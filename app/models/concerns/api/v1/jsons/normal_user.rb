module Api
  module V1
    module Jsons
      module NormalUser
        extend ActiveSupport::Concern

        included do
          def as_json(args: {}, current_user: nil)
            decorated = decorate
            {
              id: decorated.id,
              email: decorated.email,
              first_name: decorated.first_name,
              last_name: decorated.last_name,
              timezone: decorated.timezone,
              locale: decorated.locale,
              created_at: decorated.created_at.to_s,
              updated_at: decorated.updated_at.to_s
            }
          end
        end
      end
    end
  end
end
