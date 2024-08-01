class AdminUsersPresenter < BasePresenter
  def klass
    AdminUser
  end

  private

  def default_order
    %w[last_name asc]
  end
end
