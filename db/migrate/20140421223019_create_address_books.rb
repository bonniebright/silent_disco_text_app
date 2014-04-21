class CreateAddressBooks < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :phone
      t.integer :user_id
    end
  end
end
