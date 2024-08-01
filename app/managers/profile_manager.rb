class ProfileManager < BaseManager
  def klass
    NormalUser
  end

  private

  def permitted_params
    %i[
      last_name
      first_name
      locale
      timezone
      email
    ]
  end
end
