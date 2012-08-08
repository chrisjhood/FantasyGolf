require 'open-uri'
require 'xmlsimple'

class StandingsController < ApplicationController
  


    def index
      @users = User.all
      @tournaments = Tournament.all
      @tour = []
      @season
      @link
      #// list of tournaments

      #// go through each tournament, doing something like below
      # doc = Nokogiri::HTML(open("http://sports.yahoo.com/golf/pga/leaderboard/2012/38"))
      # doc.css('td[class ="earnings last"]').each do |node|
      #     golfer = node.parent.children[2]
      #       @earnings_test << golfer.text.gsub("\n", '')  
      #       @earnings_test << node.text.gsub("\n", '') 
      #     
      #     
      # end
      
      
      doc = Nokogiri::HTML(open("http://api.sportsdatallc.org/golf-t1/schedule/pga/2012/tournaments/schedule.xml?api_key=5r2y4j9uf5huw2cv8frbs7st"))
      doc.xpath('/tour').each do |link|
      puts link.content
         
          
          
      end
      
      
      
      
      # my_access_token = 5r2y4j9uf5huw2cv8frbs7st      
      #       
      # url = "http://api.sportsdatallc.org/golf-t1/schedule/pga/2012/tournaments/schedule.xml?api_key=5r2y4j9uf5huw2cv8frbs7st"
      # 
      # response = open(url).read
      # xml_response = XML.parse(response)
      # @posts = xml_response["data"] 
    
    # @config = XmlSimple.xml_in('http://api.sportsdatallc.org/golf-t1/schedule/pga/2012/tournaments/schedule.xml?api_key=5r2y4j9uf5huw2cv8frbs7st', { 'KeyAttr' => 'tournamnet id' })

    end
      
      # json_response = JSON.parse(response)
      # 
      # @posts = json_response["data"]    
            


    def update_all

    # golfer = grabdatafromoutsidesource(golfer)
    # earnings = grabdatafromoutsidesource(earnings)

    end

end
