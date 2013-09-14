require 'spec_helper'

feature 'Signing up' do
	scenario 'Successful sign up' do
		visit '/'

		sign_up_user('user@example.com', 'password')

		expect(page).to have_content 'Successfully signed up'
	end




	def sign_up_user(email, password)
		click_link 'Sign up'
		fill_in 'Email',                 with: email
		fill_in 'user[password]',        with: password
		fill_in 'Password confirmation', with: password
		click_button 'Sign up'
	end
end
