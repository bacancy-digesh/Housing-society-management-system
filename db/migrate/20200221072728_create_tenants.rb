# frozen_string_literal: true

class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :tenant_name
      t.string :contact_no
      t.belongs_to :member

      t.timestamps
    end
  end
end
