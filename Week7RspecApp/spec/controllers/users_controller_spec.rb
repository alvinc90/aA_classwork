require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #new" do  
        it "renders the new users template" do
        get :new
        expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do
        let(:user_params) do
            { user: { username: "alvin123", password: "password123" }}
        end

        context "with valid params" do
            it "should log in the user" do
                post :create, params: user_params
                user = User.find_by(username: "alvin123")
                expect(session[:session_token]).to eq(user.session_token)
            end
            
            it "redirects to the users show page" do
                post :create, params: user_params
                user = User.find_by(username: "alvin123")
                expect(response).to redirect_to(user_url(user))  
            end
        end

        context "with invalid params" do
            it "validates the presence of password and renders the new template with errors" do
                post :create, params: { 
                    user: { username: "alvin123", password: "",} }
                
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end
    end

    subject(:user) do
        User.create!(
        username: "alvin123",
        password: "password123")
    end

    describe "GET #show" do
        it "renders the show template" do
            get :show, params: {id: user.id}
            expect(response).to render_template(:show)
        end
    end
end
