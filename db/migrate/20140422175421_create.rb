class Create < ActiveRecord::Migration
  def change
    create_table :recipients_texts do |t|
      t.belongs_to :recipient
      t.belongs_to :text
    end
  end
end
