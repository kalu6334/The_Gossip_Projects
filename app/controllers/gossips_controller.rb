class GossipsController < ApplicationController
    before_action :authenticate_user, only: [:new, :show, :edit, :delete]
  
    def new
    end
  
    def create
      @gossip = Gossip.new(title:params[:title], content:params[:content], user:current_user)
      if @gossip.save
        flash[:notice] = "New gossip created! Congrats!!!"
        redirect_to root_path
      else 
        flash.now[:alert] = "Error while writting the gossip!  :("
        render new_gossip_path
      end
    end
    
    def show
      @gossip = Gossip.all.find_by(id:params[:id])
      @comment = Comment.new
      @comment.gossip_id = @gossip.id
    end
  
    def edit
      @gossip = Gossip.all.find_by(id:params[:id])
    end
  
    def update
      @gossip = Gossip.all.find_by(id:params[:id])
      if author?(@gossip.user)
        if @gossip.update(post_params)
          flash[:notice] = "Gossip has been updated :)"
          redirect_to @gossip
        end
      else
        flash[:alert] = "You can't update someone else gossip!"
        redirect_to @gossip
      end
    end
  
    def destroy
      @gossip = Gossip.all.find_by(id:params[:id])
      if author?(@gossip.user)
        @gossip.destroy
        flash[:notice] = "Gossip has been deleted :)"
        redirect_to root_path
      else
        flash[:alert] = "You can't delete someone else gossip!"
        redirect_to root_path
      end
    end
      
    def post_params
      params.require(:gossip).permit(:title, :content)
    end
  
    private
  
    def authenticate_user
      unless current_user
        flash.now[:alert] = "Please log in."
        redirect_to new_session_path
      end
    end
  
  end