class LocationsPresenter < BasePresenter
  def klass
    Location
  end

  private

  def default_order
    %w[name asc]
  end
end
