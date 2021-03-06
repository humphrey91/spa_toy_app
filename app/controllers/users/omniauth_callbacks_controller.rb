# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def github
    oauthorize "github"
  end

  def google_oauth2
    oauthorize "gplus"
  end

  private

    def oauthorize(kind)
      @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        FlashNotificationsJob.set(wait: 1.seconds).perform_later current_user.id, "info", "Welcome", "Have a look around."
      else
        session["devise.#{kind}_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_user_registration_url
      end  
    end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
