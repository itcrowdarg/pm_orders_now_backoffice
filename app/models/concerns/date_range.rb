module DateRange
  extend ActiveSupport::Concern
  included do
    attr_accessor :daterange_from_to, :daterange_from, :daterange_to

    def get_daterange_from_to(daterange_from_to)
      now = Time.zone.now

      case daterange_from_to
      when 'Hoy', 'Today'
        daterange_from = now.beginning_of_day.to_s
        daterange_to = now.end_of_day.to_s
      when 'Ayer', 'Yesterday'
        daterange_from = now.yesterday.beginning_of_day.to_s
        daterange_to = now.yesterday.end_of_day.to_s
      when 'Ultimos 7 días', 'Last 7 Days'
        daterange_from = (now - 6.days).beginning_of_day.to_s
        daterange_to = now.end_of_day.to_s
      when 'Ultimos 30 días', 'Last 30 Days'
        daterange_from = (now - 29.days).beginning_of_day.to_s
        daterange_to = now.end_of_day.to_s
      when 'Mes actual', 'This Month'
        daterange_from = now.beginning_of_month.beginning_of_day.to_s
        daterange_to = now.end_of_month.end_of_day.to_s
      when 'Mes anterior', 'Last Month'
        daterange_from = (now - 1.month).beginning_of_month.beginning_of_day.to_s
        daterange_to = (now - 1.month).end_of_month.end_of_day.to_s
      else
        if daterange_from_to.present?
          daterange_from, daterange_to = daterange_from_to.split(' - ')
          # Time.zone.strptime(daterange_from, "%m/%d/%Y %H:%M:%S").to_s
          # Time.zone.strptime(daterange_to, "%m/%d/%Y %H:%M:%S").to_s
        else
          daterange_from = nil
          daterange_to = nil
        end
      end

      [(daterange_from + ':00'), (daterange_to + ':59')]
    end
  end
end
