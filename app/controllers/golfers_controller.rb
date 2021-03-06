class GolfersController < ApplicationController
  # GET /golfers
  # GET /golfers.json
  require 'open-uri'
  
  def refresh_golfer_list
    Golfer.destroy_all
     url = "http://api.sportsdatallc.org/golf-t1/profiles/pga/2012/players/profiles.xml?api_key=5r2y4j9uf5huw2cv8frbs7st"
      doc = Nokogiri::XML(open(url))
      
      @gt = doc.children.children.children.each do |x| 

            if x.attributes["id"] && x.attributes["id"].value
              @golfer = Golfer.new
             @golfer.api_id = x.attributes["id"].value
           end
           
            if x.attributes["first_name"] && x.attributes["first_name"].value
            @golfer.first_name = x.attributes["first_name"].value
             
            end
            
            
             if x.attributes["last_name"] && x.attributes["last_name"].value
               
               @golfer.last_name = x.attributes["last_name"].value
             end

          @golfer.save if @golfer
        
      end
      redirect_to :action => 'index'
  end
  
  def index
    @golfers = Golfer.all
   
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @golfers }
    end
  end

  # GET /golfers/1
  # GET /golfers/1.json
  def show
    @golfer = Golfer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @golfer }
    end
  end

  # GET /golfers/new
  # GET /golfers/new.json
  def new
    @golfer = Golfer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @golfer }
    end
  end

  # GET /golfers/1/edit
  def edit
    @golfer = Golfer.find(params[:id])
  end

  # POST /golfers
  # POST /golfers.json
  def create
    @golfer = Golfer.new(params[:golfer])

    respond_to do |format|
      if @golfer.save
        format.html { redirect_to @golfer, notice: 'Golfer was successfully created.' }
        format.json { render json: @golfer, status: :created, location: @golfer }
      else
        format.html { render action: "new" }
        format.json { render json: @golfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /golfers/1
  # PUT /golfers/1.json
  def update
    @golfer = Golfer.find(params[:id])

    respond_to do |format|
      if @golfer.update_attributes(params[:golfer])
        format.html { redirect_to @golfer, notice: 'Golfer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @golfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /golfers/1
  # DELETE /golfers/1.json
  def destroy
    @golfer = Golfer.find(params[:id])
    @golfer.destroy

    respond_to do |format|
      format.html { redirect_to golfers_url }
      format.json { head :no_content }
    end
  end
end
