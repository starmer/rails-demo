class ItemsController < ApplicationController
  
  def create
    @list = List.find(params[:item][:list_id])
    @item = Item.new(params[:item])
    
    respond_to do |format|
      if @item.save
        flash[:notice] = 'List item  was successfully added'
        format.html { redirect_to @list }
        format.xml  { render :xml => @list, :status => :created, :location => @list }
      else
        format.html { render :template => "lists/show" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
