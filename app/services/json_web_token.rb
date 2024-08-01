class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(access_token)
    decoded = JWT.decode(access_token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  end
end
