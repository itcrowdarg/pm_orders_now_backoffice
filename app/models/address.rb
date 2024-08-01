class Address < ApplicationRecord
  #--------------------------------------------- RELATION
  belongs_to :normal_user

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION
  validates :normal_user_id, presence: true
  validates :name, presence: true
  validates :address_line, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS

  #--------------------------------------------- CALLBACK METHODS

end
