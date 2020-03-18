class CreateComplains < ActiveRecord::Migration[6.0]
  def change
    create_table :complains do |t|
    	t.string :subject
    	t.text :description
    	t.boolean :status ,default:false
    	t.belongs_to :member


      t.timestamps
    end
  end
end
