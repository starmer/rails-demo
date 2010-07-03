class ListsController < ApplicationController

    def index
      @lists = List.find(:all)
      @list = List.new
    end
    
    def prioritize_items
      list = List.find(params[:id])
      items = list.items
      items.each do |item|
        pos = params['item'].index(item.id.to_s)
        if not pos.nil?
          item.position = pos + 1
          item.save
        end
      end
      render :nothing => true
    end
    
    def show
      
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
          flash[:notice] = 'List was successfully created'
          format.html { redirect_to list_by_token_url(:token => @list.link_token) }
          format.xml  { render :xml => @list, :status => :created, :location => @list }
        else
          format.html { render :action => "index" }
          format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
        end
      end
    end
end