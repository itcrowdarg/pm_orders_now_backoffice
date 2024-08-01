module Api
  module V1
    module Jsons
      module Image
        extend ActiveSupport::Concern

        included do
          def as_json(args: {}, current_user: nil)
            binding.pry
            decorated = decorate
            {
              id: decorated.id,
              kind: decorated.kind,
              file_name: decorated.file_name,
              # file_url: decorated.file_url,
              url: decorated.cloudfront_url,
              created_at: decorated.created_at.to_s,
              updated_at: decorated.updated_at.to_s
            }
          end
        end
      end
    end
  end
end
