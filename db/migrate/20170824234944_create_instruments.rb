class CreateInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :type
      t.integer :value
      t.integer :musician_id
    end
  end
end
