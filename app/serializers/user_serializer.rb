class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :email, :auth_token
	def auth_token
		object.authentications.each do |user|
			user.auth_token
		end
	end
end
