# frozen_string_literal: true

class CreatePaymentRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_records do |t|
      t.integer :total_month_maintanence
      t.belongs_to :member
      t.boolean :status, default: 'false'
      t.datetime :date_of_maintanance
      t.timestamps
    end
  end
end
