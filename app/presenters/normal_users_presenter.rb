class NormalUsersPresenter < BasePresenter
  def klass
    NormalUser
  end

  private

  def default_order
    %w[last_name asc]
  end
end
