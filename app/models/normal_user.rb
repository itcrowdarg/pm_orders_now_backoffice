class NormalUser < User
  include Api::V1::Jsons::NormalUser

  #--------------------------------------------- RELATION
  has_many :normal_user_tokens, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_one :picture_profile, as: :imageable, dependent: :destroy

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES

  #--------------------------------------------- METHODS
  def normal?
    true
  end
end
