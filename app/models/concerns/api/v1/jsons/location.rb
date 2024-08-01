module Api
  module V1
    module Jsons
      module Location
        extend ActiveSupport::Concern

        included do
          def as_json(args: {}, current_user: nil)
            decorated = decorate
            hash = {
              id: decorated.id,
              name: decorated.name,
              address: decorated.address,
              phone_number: decorated.phone_number,
              latitude: decorated.latitude,
              longitude: decorated.longitude
            }

            # hash[:images] = self.images.as_json(args: images_args(args), current_user: current_user) if images_present?(args)
            hash[:images] = images.map {|image| image.as_json(args: images_args(args), current_user: current_user)}

            # if images_present?(args)
            #   hash[:images] = images.each_with_object({}) do |image, hash|
            #     hash[image.id] = image.as_json(args: images_args(args), current_user: current_user)
            #   end
            # end

            hash[:products] = self.products.as_json(args: products_args(args), current_user: current_user) if products_present?(args)
            # hash[:product_categories] = self.product_categories.as_json(args: product_categories_args(args), current_user: current_user) if product_categories_present?(args)

            hash
          end

          def images_present?(args)
            if args.key?(:images)
              args[:images] != false
            else
              false
            end
          end

          def images_args(args)
            args[:images].is_a?(Hash) ? args[:images] : {}
          end

          def products_present?(args)
            if args.key?(:products)
              args[:products] != false
            else
              false
            end
          end

          def products_args(args)
            args[:products].is_a?(Hash) ? args[:products] : {}
          end

          # def product_categories_present?(args)
          #   if args.key?(:product_categories)
          #     args[:product_categories] != false
          #   else
          #     false
          #   end
          # end

          # def product_categories_args(args)
          #   args[:product_categories].is_a?(Hash) ? args[:product_categories] : {}
          # end

        end
      end
    end
  end
end
