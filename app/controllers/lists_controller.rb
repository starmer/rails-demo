class ListsController < ApplicationController

    def index
      @lists = List.find_all_by_cookie(get_cookie)
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
      @list.cookie = get_cookie
      
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
    
    def delete
      @list = List.find(params[:id])
      @list.destroy
      flash[:notice] = 'List was successfully deleted'

      respond_to do |format|
        format.html { redirect_to :lists }
        format.xml  { head :ok }
        format.js
      end
    end
    
    def update
      @list = List.find(params[:id])

      respond_to do |format|
        if @list.update_attributes(params[:list])
          format.html { render :template => "lists/show"  }
          format.xml  { head :ok }
          format.js
        else
          format.html { render :template => "lists/show" }
          format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
    
    def get_cookie
      if cookies[:lists].nil?
        cookies[:lists] = {
          :value => Token.create(64).token,
          :expires => 10.years.from_now,
        }
      end
      cookies[:lists].to_s
    end
end