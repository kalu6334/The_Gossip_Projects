class GossipsController < ApplicationController
    def index
    end
    def show
        @gossip = Gossip.find(params[:id])
        
    end  
    def new
    end
    def create
        @gossip = Gossip.new(title:params["title"],content:params["content"], user: User.last) # avec xxx qui sont les données obtenues à partir du formulaire

        if @gossip.save # essaie de sauvegarder en base @gossip
          # si ça marche, il redirige vers la page d'index du site
          redirect_to root_path
        else
          # sinon, il render la view new (qui est celle sur laquelle on est déjà)
          render new_gossip_path
        end
    end
    def edit
    end
    def update
    end
    def destroy
    end

  
end