require "passbase_integration"
require "json"

class WebhookController < ApplicationController
  include PassbaseAPI
  skip_before_action :verify_authenticity_token

  # Receive Passbase Webhook
  def receive_webhook
    begin
      webhook = JSON.parse(request.body.read)
      identityAccessKey = webhook["key"]

      case webhook["event"]
      when "VERIFICATION_COMPLETED"
        process_verification_complete(identityAccessKey)
      when "VERIFICATION_REVIEWED"
        process_verification_reviewed(identityAccessKey)
      else
        "Error: Unable to process webhook"
      end
    rescue Exception => ex
      render :json => { :status => 400, :error => "Webhook failed" } and return
    end
    render :json => { :status => 200, data: "Webhook received" }
  end

  private

  def process_verification_complete(identityAccessKey)
    # update user object that verification is being processed
    puts "Verification in process"
  end

  def process_verification_reviewed(identityAccessKey)
    # Get the details of the user via Passbase's API
    details = getAuthenticationDetails(identityAccessKey)
    update_verification_status(details.owner.email, details.status)
  end

  # Using test user here
  def update_verification_status(email, verification_status)
    # Example here for updating a user's verification_status
    user = find_user_for_email("paul@test.com")
    update_verification_status_for_id(user.id, verification_status)
  end
end
