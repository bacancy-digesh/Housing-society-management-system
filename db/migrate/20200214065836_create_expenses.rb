# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :amount

      t.timestamps
    end
  end
end
