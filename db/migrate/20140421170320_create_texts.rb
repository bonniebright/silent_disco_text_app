class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :to
      t.string :from
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
