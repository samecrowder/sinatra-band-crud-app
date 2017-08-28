class Musician < ActiveRecord::Base
  belongs_to :band
  has_many :instruments

  has_secure_password
end