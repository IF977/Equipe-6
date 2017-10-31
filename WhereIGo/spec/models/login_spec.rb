require 'rails_helper'
require 'application_helper'

RSpec.describe User, :type => :request do
  
    before do
        values = {:name => 'edu',
                  :email => 'edu@edu',
                  :password_digest => 'eduedu',
                  :is_client => true
        }
        @user = User.create values
    end
  
    context "#login" do
        it "o usuario passa o email certo e a senha errada" do
            visit '/login'
            fill_in "email", :with => 'edu@edu'
            fill_in "password", :with => '123456'
            click_button "Entrar"
            expect(page).to have_text 'Usuário ou senha incorretas!'
        end
        it "o usuario passa o email errado e a senha errada" do
            visit '/login'
            fill_in "email", :with => 'edu@ed'
            fill_in "password", :with => '12'
            click_button "Entrar"
            expect(page).to have_text 'Usuário não encontrado!'
        end
        it "o usuario passa o email errado e a senha certa" do
            visit '/login'
            fill_in "email", :with => 'edu@eu'
            fill_in "password", :with => 'edu'
            click_button "Entrar"
            expect(page).to have_text 'Usuário não encontrado!'
        end
        it "o usuario passa o email certo e a senha certa (caso feliz)" do
            visit '/login'
            fill_in "email", :with => 'edu@edu'
            fill_in "password", :with => 'eduedu'
            click_button "Entrar"
            visit '/c/dashboard'
            expect(page).to have_text 'Bares e restaurantes perto de você'
        end
    end

end
