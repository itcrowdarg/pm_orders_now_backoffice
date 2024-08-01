class OrderItem < ApplicationRecord
  #--------------------------------------------- RELATION
  belongs_to :order
  belongs_to :product

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION
  validates :order_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS

  #--------------------------------------------- CALLBACK METHODS

end
