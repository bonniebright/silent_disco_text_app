class Addtextidrecipientid < ActiveRecord::Migration
  def change
    add_column :texts, :recipient_id, :integer
    add_column :recipients, :text_id, :integer
  end
end
