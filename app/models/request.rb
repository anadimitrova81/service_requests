class Request < ApplicationRecord
  before_create :generate_customer_id

  STATUSES = %w[pending pickup_confirmed picked_up in_progress ready_for_delivery delivery_confirmed delivered cancelled]
  BULGARIAN_PHONE_REGEX = /\A(\+359|0)(87|88|89|98|99|43|2)\d{7}\z/
  SAME_DAY_CUTOFF_HOUR = 16

  validates :name, :phone, :email, :address_line_1, :pick_up_at, presence: true
  validates :customer_id, uniqueness: true, allow_nil: true
  validates :phone, format: { with: BULGARIAN_PHONE_REGEX,
                              message: "must be a valid Bulgarian phone number (e.g. +359881234567 or 0881234567)", },
                    allow_blank: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  validate :pick_up_at_not_in_the_past, if: -> { pick_up_at.present? }

  class << self
    def earliest_pick_up_date
      Time.current.hour < SAME_DAY_CUTOFF_HOUR ? Date.current : Date.tomorrow
    end

    def statuses_for(role)
      {
        admin: STATUSES,
        courier: %w[pickup_confirmed delivery_confirmed],
        operator: %w[picked_up in_progress],
        coordinator: %w[pending ready_for_delivery],
      }[role.to_sym]
    end
  end

  private

  def pick_up_at_not_in_the_past
    earliest = self.class.earliest_pick_up_date
    if pick_up_at.to_date < earliest
      errors.add(:pick_up_at, "must be #{earliest == Date.current ? 'today' : 'tomorrow'} or later")
    end
  end

  def generate_customer_id
    today = Date.current
    month = today.month < 10 ? "4#{today.month}" : today.month.to_s
    day = today.strftime "%d"
    daily_count = Request.where(created_at: today.all_day).count + 1
    self.customer_id = "#{month}#{day}#{daily_count}"
  end
end
