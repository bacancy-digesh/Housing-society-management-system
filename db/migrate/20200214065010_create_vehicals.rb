class CreateVehicals < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicals do |t|
      t.string :vehical_no
      t.belongs_to :member

      t.timestamps
    end
  end
end
