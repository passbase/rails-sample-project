class ApplicationController < ActionController::Base
  def find_user_for_email(email)
    user = User.where("email LIKE :query", query: email).first
    return user
  end

  def update_verification_status_for_id(id, status)
    # Update your user's status here
  end
end
