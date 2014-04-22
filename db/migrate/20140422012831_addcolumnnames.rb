class Addcolumnnames < ActiveRecord::Migration
  def change
    rename_table :addresses, :recipients
  end
end
