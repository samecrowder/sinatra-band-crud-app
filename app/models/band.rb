class Band < ActiveRecord::Base
  has_many :musicians
  has_many :instruments, through: :musicians
end