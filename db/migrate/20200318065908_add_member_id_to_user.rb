class AddMemberIdToUser < ActiveRecord::Migration[6.0]
  def change
  	 add_reference :users, :member, foreign_key: true
  end
end
