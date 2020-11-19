require "base64"
require "json"

class WelcomeController < ApplicationController

  # This function uses my hosted link and encodes a user email
  def getEncodedHostedLink
    yourPassbaseLink = "https://verify.passbase.com/mathias"

    # Fill in the users email from your own db to skip email step
    preFillAttributes = { "prefill_attributes" => {
      "email" => "paul@test.com",
    } }
    encodedAttributes = Base64.strict_encode64(preFillAttributes.to_json)
    encodedLink = yourPassbaseLink + "?p=" + encodedAttributes
    return encodedLink
  end

  helper_method :getEncodedHostedLink
end
