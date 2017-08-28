class Instrument < ActiveRecord::Base
  belongs_to :musician
  belongs_to :band
end