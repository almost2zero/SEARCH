class Users::OmnioauthCallbacksController < Devise::OmnioauthCallbacksController
	def facebook
		@user = User.find_or_create_from_auth_hash
		if @user.persisted?
			sign_in_and_redirect @user
		else
			session["devise.user_attributes"] = @user.attributes
			redirect_to new_user_registration_url, notice "Oops, something went wrong"
		end		
	end

	private

	def auth_hash
		requests.env['omniauth.auth']
	end	
		
end