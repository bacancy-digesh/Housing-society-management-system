# frozen_string_literal: true

class AddcolumnToVehical < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicals, :description, :text
  end
end
