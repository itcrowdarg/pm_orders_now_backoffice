class BasePresenter
  attr_reader :filter

  def initialize(params: nil, session: nil, current_user: nil)
    @params = params
    @session = session
    @current_user = current_user if current_user.present?
    @filter = filter_klass.new(filter_params)
    order_params

    # para poder usarlos en los params en los helper sin problemas
    @params = @params.permit!
  end

  def filter_klass
    "#{klass}Filter".constantize
  end

  def klass
    raise StandardError, 'It must be defined in subclass'
  end

  def list(paginate: true, decorate: true)
    return @list unless @list.nil?

    table_name = if klass.base_class?
                   klass.to_s.tableize
                 else
                   klass.superclass.to_s.tableize
                 end

    @list = @filter.call(current_user: @current_user)
    @list = @list.sorting_order(order_params, table_name)
    @list = @list.paginate(page:, per_page:) if paginate
    @list = @list.decorate if decorate
    @list
  end

  def per_page
    if @session.present?
      @session[:per_page] = if @params[:per_page].blank?
                              @session[:per_page].nil? ? 20 : @session[:per_page].to_i
                            else
                              @params[:per_page].to_i
                            end
    else
      @params[:per_page].blank? ? 20 : @params[:per_page].to_i
    end
  end

  def pagination_info_data
    return @pagination_info_data unless @pagination_info_data.nil?

    @pagination_info_data = {}
    @pagination_info_data[:total_items] = list.total_entries
    @pagination_info_data[:page_items] = list.size
    @pagination_info_data[:total_pages] = list.total_pages
    @pagination_info_data[:prev_page] = list.previous_page
    @pagination_info_data[:next_page] = list.next_page
    @pagination_info_data
  end

  private

  def page
    @params[:page].presence || 1
  end

  def filter_params
    @params.fetch(:filter, {}).permit!
  end

  def order_params
    @params[:order] ||= default_order
    @params.fetch(:order)
  end

  def default_order
    raise StandardError, 'It must be defined in subclass'
  end
end
