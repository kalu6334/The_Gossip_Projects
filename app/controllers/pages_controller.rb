class PagesController < ApplicationController
    def team
    end
    def contact
    end
    def home
        @gossips = Gossip.all
    end
    def welcome
        @welcome = params[:first_name]
    end
    
  
end
