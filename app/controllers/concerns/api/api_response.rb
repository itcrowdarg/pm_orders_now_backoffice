module Api
  module ApiResponse
    def json_response(data: nil, message: nil, errors: nil, status: :ok)
      response = {}
      response[:status] = %i[ok created no_content].include?(status) ? :ok : :error
      response[:message] = message if message.present?
      response[:errors] = errors if errors.present?
      response[:data] = data unless data.nil?
      render json: response, status:
    end
  end
end
