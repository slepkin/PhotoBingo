module ApplicationHelper

  # def login(user)
  #   user.update_attribute(:token, SecureRandom.urlsafe_base64)
  #   session[:token] = user.token
  #   redirect_to "/"
  # end
  #
  # def enforce_login
  #   unless current_user
  #     redirect_to new_session_url
  #   end
  # end
  #
  # def current_user
  #   @current_user || User.find_by_token(session[:token])
  # end

end
