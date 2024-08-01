class User < ApplicationRecord
  include Timezones

  #--------------------------------------------- RELATION

  #--------------------------------------------- MISC
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :trackable, :registerable, :confirmable

  #--------------------------------------------- VALIDATION
  validates :first_name, :last_name, presence: true
  validates :timezone, inclusion: { in: User::TIMEZONES.map { |t| t.last } }
  validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES
  scope :order_default, -> { order('users.last_name ASC, users.first_name ASC') }

  #--------------------------------------------- METHODS
  def to_s
    "#{first_name} #{last_name}"
  end

  def signed_in_already?
    sign_in_count > 0
  end

  def destroyable?
    if trigger_user == self
      errors.add(:base, I18n.t(:cannot_delete_yourself, scope: 'errors.messages'))
      return false
    end

    true
  end

  def admin?
    false
  end

  def normal?
    false
  end

  #--------------------------------------------- CALLBACK METHODS
end
