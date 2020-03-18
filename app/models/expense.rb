class Expense < ApplicationRecord
	validates :title ,presence: true
	validates :description ,presence: true
	validates :date ,presence: true
	validates :amount ,presence: true
	resourcify
end
