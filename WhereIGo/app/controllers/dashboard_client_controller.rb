class DashboardClientController < ApplicationController
    
    def flash_message(message)
        session[:return_to] ||= request.referer
    	redirect_to session.delete(:return_to), :flash => {:error => message}
    	return
    end
    
    def user_is_authorized_?
        if session[:current_user_id] == nil
            redirect_to({:controller =>'account', :action => 'login'}, :flash => {:error => "Faça login para continuar!"})  and return false
        else
            user_logged = User.find_by(id: session[:current_user_id])
            if user_logged.is_client != true
                redirect_to({:controller =>'dashboard_provider', :action => 'my_establishments'}, :flash => {:error => "O usuário não possui um perfil de dono de estabelecimento."}) and return false
            end
            return true
        end
    end
    
    
    def all_establishments
        @title = "Dashboard"
        @establishments = Establishment.all
        
        if user_is_authorized_?
            render layout: "client"
        end
    end
    
    def show_establishment
        @e = Establishment.find_by(id: params[:id])
        @title = @e.name
        count_review_up = EstablishmentReview.where(:review => true).where(:establishment_id => @e.id).count
        count_review_down = EstablishmentReview.where(:review => false).where(:establishment_id => @e.id).count
        
        if count_review_up != 0 || count_review_down != 0
            rating = (count_review_up.to_f / (count_review_up + count_review_down)) * 100
            @rating_percentage = rating.round(0).to_s + '%'
        end

        if user_is_authorized_?
            render layout: "client"
        end
        
    end
    
    def user_review_establishment
        
        user = session[:current_user_id]
        establishment = params[:id]
        review = params[:review]
        values = {:user_id => user,
                  :establishment_id => establishment,
                  :review => review
        }
        
        #Checa se o user ja avaliou determinado restaurante
        user_reviews = EstablishmentReview.where(user_id: user)
        if user_reviews.exists?(:establishment_id => establishment)
            user_reviews.where(establishment_id: establishment).update(:review => review)
        else
            EstablishmentReview.create values
        end
        
        redirect_to '/c/establishment/' + establishment
        return
    
    end
end
