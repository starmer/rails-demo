class ListsController < ApplicationController

    def index
      @lists = List.find(:all)
    end
    
    def create
      @list = List.create!(params[:list])
      
      @list.link_token = Token.create.token
      @list.edit_token = Token.create.token
      
      @list.save!
      
      flash[:notice] = "Created #{@list.title}."
      redirect_to lists_path
    end
end