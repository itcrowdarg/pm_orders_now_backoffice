class AdminUserManager < BaseManager
  def klass
    AdminUser
  end

  def create
    @buffer_action = :create
    @object = klass.new(object_params)
    @object.trigger_user = @current_user
    @object.skip_confirmation!
    @object.save_and_log
  end

  private

  def permitted_params
    %i[
      last_name
      first_name
      email
      password
      password_confirmation
    ]
  end
end
