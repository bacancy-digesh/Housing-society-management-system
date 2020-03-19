# frozen_string_literal: true

class Visitor < ApplicationRecord
  resourcify
  validates :name, presence: true
  belongs_to :member
end
