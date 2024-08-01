module Shared
  module WillPaginateHelper
    def will_paginate_params(args = {})
      paginate_params = {
        previous_label: '<i class="bi bi-chevron-left"></i>',
        next_label: '<i class="bi bi-chevron-right"></i>',
        inner_window: 1,
        outer_window: 1
      }
      paginate_params.merge!(args)
      paginate_params
    end
  end
end
