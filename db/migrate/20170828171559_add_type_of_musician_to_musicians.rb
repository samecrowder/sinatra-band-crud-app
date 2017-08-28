class AddTypeOfMusicianToMusicians < ActiveRecord::Migration[5.0]
  def change
    add_column(:musicians, :type_of_musician, :string)
  end
end
