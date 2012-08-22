class Tournament < ActiveRecord::Base
  require 'open-uri'
  attr_accessible :name, :api_id, :winning_share, :purse
  
  has_many :picks
  has_and_belongs_to_many :golfers
  
  # def refresh_golfer_list
  #   url = "http://api.sportsdatallc.org/golf-t1/summary/pga/2012/tournaments/#{api_id}/summary.xml?api_key=5r2y4j9uf5huw2cv8frbs7st"
  #    doc = Nokogiri::XML(open(url))
  #     
  #     doc.children.children[5].children.each do |x|
  #      
  #      if x.attributes["id"] && x.attributes["id"].value
  #        
  #        golfer = Golfer.find_by_api_id(x.attributes["id"].value)
  #        @list_of_golfers << golfer
  #        self.golfers << golfer
  #        self.save
  #      end
  # 
  #    end
  #    
  #   
  #  end 
end
