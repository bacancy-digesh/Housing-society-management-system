class CreateVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :visitors do |t|
      t.string :name
      t.integer :contact_no
      t.string :description
      t.belongs_to :member

      t.timestamps
    end
  end
end
