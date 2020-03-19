# frozen_string_literal: true

class ParkingSlot < ApplicationRecord
  resourcify
  belongs_to :vehical
end
