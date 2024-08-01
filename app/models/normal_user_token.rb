class NormalUserToken < ApplicationRecord
  include Api::V1::Jsons::NormalUserToken

  #--------------------------------------------- RELATION
  belongs_to :normal_user

  #--------------------------------------------- MISC
  HOURS_TO_EXPIRE = 24

  #--------------------------------------------- VALIDATION
  validates :normal_user, presence: true

  #--------------------------------------------- CALLBACK

  #--------------------------------------------- SCOPES
  scope :order_default, -> { order('normal_user_tokens.id DESC') }
  scope :filter_active, -> { where('normal_user_tokens.datetime_expiration  >= ?', Time.now) }
  scope :filter_inactive, -> { where('normal_user_tokens.datetime_expiration  < ?', Time.now) }

  #--------------------------------------------- METHODS

  def active?
    datetime_expiration >= Time.now
  end

  def inactive?
    !active?
  end

  def self.generate(normal_user:)
    # Clean old tokens
    normal_user.normal_user_tokens.delete_all

    datetime_expiration = NormalUserToken::HOURS_TO_EXPIRE.hours.from_now

    normal_user_token = NormalUserToken.create(
      normal_user_id: normal_user.id
    )

    access_token_encoded = JsonWebToken.encode({
                                                 token_id: normal_user_token.id,
                                                 user_id: normal_user.id,
                                                 exp: datetime_expiration.to_i
                                               })

    normal_user_token.update(
      access_token: access_token_encoded,
      refresh_token: SecureRandom.base64(30),
      datetime_expiration: datetime_expiration
    )

    normal_user_token
  end

  def refresh
    normal_user_token = NormalUserToken.generate(
      normal_user: normal_user
    )
    destroy

    normal_user_token
  end
end
