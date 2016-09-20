require 'spec_helper'
describe User do
	it 'user is create' do
		user = User.create(name: 'Prakash1',email: 'ch@gmail1.com',password: '123456')
		expect(User.last.name).to eq(user.name)
	end
end