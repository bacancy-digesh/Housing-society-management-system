# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :owner_name
      t.integer :contact_no
      t.string :email
      t.string :block
      t.integer :house_no

      t.timestamps
    end
  end
end
