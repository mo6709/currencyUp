require 'jwt'

class Auth
	def self.create_token(account_object)
		payload = { account: JSON.parse(account_object.to_json) }
		JWT.encode(payload, 'myapp', 'HS256')
	end

	def self.decode_token(token)
        begin
		    JWT.decode( token, "myapp", true, {  algorithm: 'HS256' })
		rescue 
			# Handle invalid token, e.g. logout user or deny access
			puts 'Audience Error'
		end
	end
end