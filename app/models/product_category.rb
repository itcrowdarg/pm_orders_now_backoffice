class ProductCategory < ApplicationRecord
  #--------------------------------------------- RELATION
  belongs_to :location
  has_many :products

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION
  validates :location_id, presence: true
  validates :name, presence: true, uniqueness: true

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS

  #--------------------------------------------- CALLBACK METHODS

end
