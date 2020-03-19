# frozen_string_literal: true

class Visitor < ApplicationRecord
  resourcify
  belongs_to :member
end
