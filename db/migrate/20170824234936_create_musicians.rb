class CreateMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :type
      t.integer :net_worth
      t.integer :band_id
    end
  end
end
