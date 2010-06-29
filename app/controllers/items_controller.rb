class ItemsController < ApplicationController
  
  def delete
    @item = Item.find(params[:id])
    @list = List.find(@item.list_id)
    @item.destroy
    flash[:notice] = 'List item  was successfully deleted'

    respond_to do |format|
      format.html { redirect_to(@list) }
      format.xml  { head :ok }
      format.js
    end
  end

  def create
    @list = List.find(params[:item][:list_id])
    @item = Item.new(params[:item])
    
    respond_to do |format|
      if @item.save
        flash[:notice] = 'List item  was successfully added'
        format.html { redirect_to @list }
        format.xml  { render :xml => @list, :status => :created, :location => @list }
        format.js
      else
        flash[:notice] = 'Unable to create list item'
        format.html { render :template => "lists/show" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @list = List.find(@item.list_id)

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to @list }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :template => "lists/show" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end
  
end
