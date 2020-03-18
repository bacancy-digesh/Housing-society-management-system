class Vehical < ApplicationRecord
	resourcify
	belongs_to :member
	has_one :parking_slot,dependent: :destroy

end
