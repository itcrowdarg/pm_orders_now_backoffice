module Shared
  module ModalHelper
    def current_modal_id
      case turbo_frame_id
      when 'form-entity-two'
        'modal-form-entity-two'
      when 'form-entity'
        'modal-form-entity'
      else
        ''
      end
    end

    def previous_modal_id
      case current_modal_id
      when 'modal-form-entity-two'
        'modal-form-entity'
      end
    end
  end
end
