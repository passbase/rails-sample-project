require "passbase"

module PassbaseAPI
  Passbase.configure do |config|
    config.api_key["X-API-KEY"] = ENV["PASSBASE_SECRET_API_KEY"]
  end

  def getAuthenticationDetails(id)
    begin
      api_instance = Passbase::IdentityApi.new
      identity = api_instance.get_identity_by_id(id)
      return identity
    rescue Passbase::ApiError => e
      puts "Exception when calling IdentityApi->get_identity_by_id: #{e}"
    end
  end
end
