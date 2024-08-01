class AdminUserFilter
  include DateRange
  include ActiveModel::Model
  #--------------------------------------------- MISC
  ADVANCED_FILTERS = [:daterange_from_to]
  attr_accessor :query

  #--------------------------------------------- VALIDATION

  #--------------------------------------------- METHODS
  def initialize(args)
    super(args)
    begin
      @daterange_from, @daterange_to = get_daterange_from_to(@daterange_from_to)
    rescue StandardError
      # handle invalid date
      @daterange_from = nil
      @daterange_to = nil
      @daterange_from_to = ''
    end
  end

  def call(current_user:)
    admin_users = admin_users(current_user:)
    admin_users = filter_by_query(admin_users)
    filter_by_daterange_from_to(admin_users)
  end

  def admin_users(current_user:)
    raise ActiveRecord::RecordNotFound unless current_user.admin?

    AdminUser.all
  end

  private

  def filter_by_query(admin_users)
    array_part = []
    if query.present?
      query.split(' ').each do |part|
        part_fixed = "'#{part}'"
        part_like = "'%#{part}%'"
        array_part << "(
          users.first_name ILIKE #{part_like} OR
          users.last_name ILIKE #{part_like} OR
          users.email ILIKE #{part_like} OR
          users.id::text ILIKE #{part_fixed}
        )"
      end
      admin_users = admin_users.where(array_part.join(' AND '))
    end
    admin_users
  end

  def filter_by_daterange_from_to(admin_users)
    if daterange_from.present?
      admin_users = admin_users.where('users.created_at >= ?',
                                      Time.zone.strptime(daterange_from, '%m/%d/%Y %H:%M:%S'))
    end
    if daterange_to.present?
      admin_users = admin_users.where('users.created_at <= ?',
                                      Time.zone.strptime(daterange_to, '%m/%d/%Y %H:%M:%S'))
    end
    admin_users
  end
end
