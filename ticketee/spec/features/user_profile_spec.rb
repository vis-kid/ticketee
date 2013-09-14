require 'spec_helper'

feature 'Profile page' do
	scenario 'viewing' do
		user = create_user
		visit user_path(user)

		expect(page).to have_content(user.name)
		expect(page).to have_content(user.email)
	end

	scenario 'Updating a user' do
		user = create_user
		visit user_path(user)
		click_link 'Edit Profile'

		fill_in 'Username', with: 'new_username'
		click_button 'Update Profile'

		expect(page).to have_content 'Profile has been updated'
	end


	def create_user
		user = FactoryGirl.create(:user)
	end
end



