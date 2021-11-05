class GossipsController < ApplicationController
    def index
      @gossips = Gossip.all 
    end
    def show
        @gossip = Gossip.find(params[:id])
        
    end  
    def new
    end
    def create
        @gossip = Gossip.new(title:params["title"],content:params["content"]) #,user: User.last) # avec xxx qui sont les données obtenues à partir du formulaire

        if @gossip.save # essaie de sauvegarder en base @gossip
          # si ça marche, il redirige vers la page d'index du site
          redirect_to root_path 
        else
          # sinon, il render la view new (qui est celle sur laquelle on est déjà)
          render new_gossip_path
        end
    end
    def edit
      @gossip = Gossip.find(params[:id])
    end
    def update
      @gossip = Gossip.find(params[:id])
      post_params = params.require(:gossip).permit(:title, :content)
      if @gossip.update(post_params)
       redirect_to @gossip
       else
        render :edit
      end
    end
    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to gossips_path
    end

    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end

  
end