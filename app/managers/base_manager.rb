class BaseManager
  attr_reader :object, :buffer_action

  def initialize(params: nil, object: nil, current_user: nil, source: :app)
    @params = params                    if params.present?
    @object = object                    if object.present?
    @current_user = current_user        if current_user.present?
    @source = source                    if source.present?
    @error_message = nil
  end

  def error_message
    return @error_message unless @error_message.nil?

    case buffer_action
    when :create
      @error_message = I18n.t(:error, scope: %i[messages create])
    when :update
      @error_message = I18n.t(:error, scope: %i[messages update])
    when :destroy
      @error_message = @object.errors.full_messages.join(',') if @object.present?
      @error_message = I18n.t(:error, scope: %i[messages destroy]) if @error_message.blank?
    end

    @error_message
  end

  def source_api?
    @source == :api
  end

  def source_app?
    @source == :app
  end

  def build
    klass.new
  end

  def create
    @buffer_action = :create
    @object = klass.new(object_params)
    @object.trigger_user = @current_user
    @object.save_and_log
  end

  def update
    @buffer_action = :update
    @object.trigger_user = @current_user
    @object.update_and_log(object_params)
  end

  def destroy
    @buffer_action = :destroy
    @object.trigger_user = @current_user
    @object.destroy_and_log
  end

  def klass
    raise StandardError, 'It must be defined in subclass'
  end

  private

  def object_params
    @params.require(klass.to_s.underscore.to_sym).permit(permitted_params)
  end

  def permitted_params
    raise StandardError, 'It must be defined in subclass'
  end
end
