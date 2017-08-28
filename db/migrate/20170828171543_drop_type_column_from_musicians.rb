class DropTypeColumnFromMusicians < ActiveRecord::Migration[5.0]
  def change
    remove_column(:musicians, :type)
  end
end
