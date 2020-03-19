# frozen_string_literal: true

class CreateParkingSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :parking_slots do |t|
      t.string :slot
      t.belongs_to :vehical

      t.timestamps
    end
  end
end
