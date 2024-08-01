class Review < ApplicationRecord
  #--------------------------------------------- RELATION
  has_many :images, as: :imageable, dependent: :destroy
  belongs_to :user
  belongs_to :location

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION
  validates :user_id, presence: true
  validates :location_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true

  #--------------------------------------------- CALLBACK
  after_save :update_location_average_rating
  after_destroy :update_location_average_rating

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS

  private

  def update_location_average_rating
    location.update_average_rating
  end

end
