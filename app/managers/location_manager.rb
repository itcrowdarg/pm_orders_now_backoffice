class LocationManager < BaseManager
  def klass
    Location
  end

  def create
    @buffer_action = :create
    @object = klass.new(object_params)
    @object.trigger_user = @current_user

    if @object.save_and_log
      true
    else
      nil
    end
  end

  def update
    @buffer_action = :update
    @object.trigger_user = @current_user

    if @object.update_and_log(object_params)
      true
    else
      nil
    end
  end

  private

  def permitted_params
    [
      :name,
      :address,
      :phone_number,
      :is_active,
      :is_featured,
      :latitude,
      :longitude,
      images_attributes: [
        :_destroy,
        :kind,
        :id,
        :purge,
        :file
      ]
    ]
  end
end
