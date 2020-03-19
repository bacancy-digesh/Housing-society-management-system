# frozen_string_literal: true

class Expense < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :amount, presence: true
  resourcify
end
