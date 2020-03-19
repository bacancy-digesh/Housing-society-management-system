# frozen_string_literal: true

class Tenant < ApplicationRecord
  belongs_to :member
end
