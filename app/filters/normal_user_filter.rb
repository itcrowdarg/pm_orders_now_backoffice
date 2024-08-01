class NormalUserFilter
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
    normal_users = normal_users(current_user:)
    normal_users = filter_by_query(normal_users)
    filter_by_daterange_from_to(normal_users)
  end

  def normal_users(current_user:)
    raise ActiveRecord::RecordNotFound unless current_user.admin?

    NormalUser.all
  end

  private

  def filter_by_query(normal_users)
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
      normal_users = normal_users.where(array_part.join(' AND '))
    end
    normal_users
  end

  def filter_by_daterange_from_to(normal_users)
    if daterange_from.present?
      normal_users = normal_users.where('users.created_at >= ?',
                                        Time.zone.strptime(daterange_from,
                                                           '%m/%d/%Y %H:%M:%S'))
    end
    if daterange_to.present?
      normal_users = normal_users.where('users.created_at <= ?',
                                        Time.zone.strptime(daterange_to, '%m/%d/%Y %H:%M:%S'))
    end
    normal_users
  end
end
