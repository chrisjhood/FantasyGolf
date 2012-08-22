class TournamentsController < ApplicationController
  # GET /tournaments
  # GET /tournaments.json
  require 'open-uri'
  def refresh_tournament_list
    Tournament.destroy_all
     url = "http://api.sportsdatallc.org/golf-t1/schedule/pga/2012/tournaments/schedule.xml?api_key=5r2y4j9uf5huw2cv8frbs7st"
      doc = Nokogiri::XML(open(url))

      @gt = doc.children.children.children.each do |x| 
             
            if x.attributes["name"] && x.attributes["name"].value
              @tournament = Tournament.new
             @tournament.name = x.attributes["name"].value
           end
          
            if x.attributes["id"] && x.attributes["id"].value
            @tournament.api_id = x.attributes["id"].value
             
            end
            
            
             if x.attributes["purse"] && x.attributes["purse"].value
               
               @tournament.purse = x.attributes["purse"].value
             end
              if x.attributes["winning_share"] && x.attributes["winning_share"].value
                
                @tournament.winning_share = x.attributes["winning_share"].value

              end
          @tournament.save if @tournament
        
      end
      redirect_to :action => 'index'
  end
  
  def index
    @tournaments = Tournament.all
    
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournaments }
    end
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @tournament = Tournament.find(params[:id])
      @list_of_golfers = []
      url = "http://api.sportsdatallc.org/golf-t1/summary/pga/2012/tournaments/#{@tournament.api_id}/summary.xml?api_key=5r2y4j9uf5huw2cv8frbs7st"
       doc = Nokogiri::XML(open(url))
        # binding.pry
        doc.children.children[5].children.each do |x|

         if x.attributes["id"] && x.attributes["id"].value

           golfer = Golfer.find_by_api_id(x.attributes["id"].value)
           @list_of_golfers << golfer
           @tournament.golfers << golfer
           @tournament.save
      
       end


     end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament }
    end
  end

  # GET /tournaments/new
  # GET /tournaments/new.json
  def new
    @tournament = Tournament.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament }
    end
  end

  # GET /tournaments/1/edit
  def edit
    @tournament = Tournament.find(params[:id])
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(params[:tournament])

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render json: @tournament, status: :created, location: @tournament }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tournaments/1
  # PUT /tournaments/1.json
  def update
    @tournament = Tournament.find(params[:id])

    respond_to do |format|
      if @tournament.update_attributes(params[:tournament])
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end
end
