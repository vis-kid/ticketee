require 'spec_helper'

describe User do
	describe 'passwords' do
		it 'needs a password and confirmation to save' do
			user = User.new(name: 'steve')
			user.save

			expect(user).to_not be_valid

			user.password = 'password'
			user.password_confirmation = ''
			user.save

			expect(user).to_not be_valid

			user.password_confirmation = 'password'
			user.save

			expect(user).to be_valid
		end

		it 'needs password and confirmation to match' do
			user = create_user_with_incorrect_password_confirmation 
 
			expect(user).to_not be_valid
		end
	end

	describe 'authentication' do
		let(:user) { create_user_with_correct_password_confirmation }

		it 'authenticates with a correct password_confirmation' do
			expect(user.authenticate('password_confirmation')).to be
		end


		it 'does not authenticate with an incorrect password_confirmation' do
			expect(user.authenticate('wrong_confirmation')).to_not be
		end
	end

	def create_user_with_incorrect_password_confirmation
    User.create(
				       name:                  'steve',
							 password:              'my_password',
							 password_confirmation: 'wrong_confirmation')
	end

	def create_user_with_correct_password_confirmation
    User.create(
				       name:                  'steve',
							 password:              'password_confirmation',
							 password_confirmation: 'password_confirmation') 
	end
end
