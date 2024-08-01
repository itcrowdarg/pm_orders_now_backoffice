class Product < ApplicationRecord
  #--------------------------------------------- RELATION
  belongs_to :location
  belongs_to :product_category
  has_many :order_items
  has_many :favorites, as: :favoritable

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :available, inclusion: { in: [true, false] }
  validates :location_id, presence: true
  validates :product_category_id, presence: true

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS

  #--------------------------------------------- CALLBACK METHODS

end
