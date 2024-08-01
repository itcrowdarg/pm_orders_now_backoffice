class Favorite < ApplicationRecord
  #--------------------------------------------- RELATION
  belongs_to :user
  belongs_to :favoritable, polymorphic: true

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION
  validates :user_id, presence: true
  validates :favoritable_id, presence: true
  validates :favoritable_type, presence: true

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS

  #--------------------------------------------- CALLBACK METHODS

end
