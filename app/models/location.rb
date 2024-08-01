class Location < ApplicationRecord
  include Api::V1::Jsons::Location

  #--------------------------------------------- RELATION
  has_many :images, as: :imageable, dependent: :destroy
  has_many :products
  has_many :reviews
  has_many :orders
  has_many :favorites, as: :favoritable

  #--------------------------------------------- MISC
  accepts_nested_attributes_for :images, allow_destroy: true
  geocoded_by :address
  # reverse_geocoded_by :latitude, :longitude

  #--------------------------------------------- VALIDATION
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  # validates :latitude, presence: true
  # validates :longitude, presence: true

  #--------------------------------------------- CALLBACK
  after_validation :geocode
  # before_save :update_geocode

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS
  def update_average_rating
    self.average_rating = ratings.average(:score).to_f.round(1)
    save
  end

  # def update_geocode
  #   if address_changed?
  #   end
  # end

  #--------------------------------------------- CALLBACK METHODS

end
