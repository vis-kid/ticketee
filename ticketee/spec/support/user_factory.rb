FactoryGirl.define do
	factory :user do
		name                  'Some Username'
		email                 'example@mail.com'
		password              'password'
		password_confirmation 'password'
	end
end
