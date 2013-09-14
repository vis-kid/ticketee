class UsersController < ApplicationController

  def show
		@user = User.find(params[:id])
  end

  def new
		@user = User.new
  end

  def create
		@user = User.new(user_params)
		if @user.save
		  redirect_to projects_path, notice: 'Successfully signed up'
		else
      render :new
		end
  end

	def edit
    @user = User.find(params[:id])
	end

	def update
    @user = User.find(params[:id])
		@user.update(user_params)
		if @user.save
			redirect_to user_path(@user), notice: 'Profile has been updated'
		else
			render :edit
		end
	end


	private

	def user_params
		params.require(:user).permit(:name, 
																 :email, 
																 :password, 
																 :password_confirmation)
	end
end
