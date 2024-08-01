class Order < ApplicationRecord
  #--------------------------------------------- RELATION
  belongs_to :normal_user
  belongs_to :location
  has_many :order_items

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION
  validates :normal_user_id, presence: true
  validates :location_id, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending confirmed delivered] }

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS

  #--------------------------------------------- CALLBACK METHODS

end
