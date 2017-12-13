class Corporation < ApplicationRecord
	serialize :regions_array, Array
	has_secure_password

	has_many :currency_corporations
	has_many :currencies, through: :currency_corporations
	has_many :transactions
	has_many :investors, through: :transactions
	has_many :corporation_investments
end
