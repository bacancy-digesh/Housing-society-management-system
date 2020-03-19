# frozen_string_literal: true

class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
