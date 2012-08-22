class Golfer < ActiveRecord::Base
  attr_accessible :name, :api_id, :first_name, :last_name
    has_many :picks
    has_and_belongs_to_many :tournaments
end
