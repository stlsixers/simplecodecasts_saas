class ProfilesController < ApplicationController
	def new
		# form where a user can fill out their own profile
		@user = User.find(params[:user_id])
		@profile = @user.build_profile
	end

	def create
		@user = User.find (params[:user_id])
		@profile = @user.build_profile(profile_params)
		if @profile.save
			redirec_to user_path(params[:user.id])
		else

		end
	end

	private
		def profile_params
			params.require(:profile).permit(:first_name,:last_name,:phone_number,:contact_email,:description)
		end
end