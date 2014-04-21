class AddPhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :int
    add_column :users, :name, :string
  end
end
