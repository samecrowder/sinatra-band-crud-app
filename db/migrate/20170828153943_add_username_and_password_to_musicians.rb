class AddUsernameAndPasswordToMusicians < ActiveRecord::Migration[5.0]
  def change
    add_column(:musicians, :username, :string)
    add_column(:musicians, :password_digest, :string)
  end
end
