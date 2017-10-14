class EstablishmentController < ApplicationController
    def index
        @title = "Meus estabelecimentos"
        @establishments = Establishment.where(user_id: session[:current_user_id])
    end
    
    def new
        @title = "Novo estabelecimento"
    end
    
    def create
        values = params.require(:establishment).permit!
        if Establishment.exists?(:cnpj => params[:establishment][:cnpj])
            redirect_to '/establishments/new', :flash => { :error => "O CNPJ já está em uso." }
            return
        else
            new_establishment = Establishment.create values
            Establishment.update(new_establishment[:id], :user_id => session[:current_user_id])
            redirect_to '/establishments'
            return
        end
    end
    
    def show
        @establishments = Establishment.find_by(id: params[:id])
    end
    
    def update
        values = params.require(:establishment).permit!
        Establishment.update(params[:id], values)
    end
    
=begin
    def review
        user = session[:current_user_id]
        
    end
=end
    
    private
    def establishment_params
        params.require(:establishment).permit(:cnpj, :name, :address, :email, :website)
    end
end
