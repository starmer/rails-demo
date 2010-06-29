class ListsController < ApplicationController

    def index
      @lists = List.find(:all)
      @list = List.new
    end
    
    def show
      puts "token: " + params[:token]
      
      if(params[:token])
        @list = List.find_by_link_token(params[:token])
      else
        @list = List.find(params[:id])  
      end
      
      @item = Item.new

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @list }
      end
    end
    
    def create
      @lists = List.find(:all)
      @list = List.new(params[:list])
      
      @list.link_token = Token.create.token
      @list.edit_token = Token.create.token
      
      respond_to do |format|
        if @list.save
          flash[:notice] = 'List was successfully created.'
          format.html { redirect_to :action => "index" }
          format.xml  { render :xml => @list, :status => :created, :location => @list }
        else
          format.html { render :action => "index" }
          format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
        end
      end
    end
end