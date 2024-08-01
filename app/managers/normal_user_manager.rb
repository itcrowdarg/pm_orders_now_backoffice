class NormalUserManager < BaseManager
  def klass
    NormalUser
  end

  def create
    @buffer_action = :create
    @object = klass.new(object_params)
    @object.trigger_user = @current_user
    # @object.skip_confirmation_notification!
    @object.save_and_log
  end

  def confirm
    @buffer_action = :update
    @object.trigger_user = @current_user
    @object.skip_confirmation!
    @object.save_and_log
  end

  def send_confirmation
    @buffer_action = :update
    @object.trigger_user = @current_user

    return if @object.confirmed?

    @object.resend_confirmation_instructions
    true
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
