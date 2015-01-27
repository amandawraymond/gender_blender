require 'spec_helper'

describe ContestantsController, type: :controller do
  before do
    Contestant.destroy_all
  end
  let(:contestant) { FactoryGirl.create(:contestant) }
 

  describe "GET new" do
    it "assigns a new Contestant to @contestant" do
      get :new
      assigns(:contestant).should be_a_new(Contestant)
    end

    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "saves the new Contestant to @contestant" do
        expect{
          post :create, contestant:  FactoryGirl.attributes_for(:contestant) 
          }.to change(Contestant, :count).by(1)
      end
      
      it "redirects to :show" do
        post :create, contestant: FactoryGirl.attributes_for(:contestant) 
        last_contestant = Contestant.last
        expect(response).to redirect_to(contestant_path(last_contestant.id))
      end
    end
  
    context "with invalid name attributes" do
      it "does not save the new Contestant to @contestant" do
         expect{
          post :create, contestant: FactoryGirl.attributes_for(:contestant, name: "") 
        }.to_not change(Contestant, :count)
      end
    
      it "re-renders :new" do
        post :create, contestant: FactoryGirl.attributes_for(:contestant, name: "") 
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET show" do
    let(:contestant) { FactoryGirl.create(:contestant) }
    
    it "assigns requested contestant to @contestant" do
      get :show, id: contestant.id
      assigns(:contestant).should eq(contestant)
    end
    
    it "renders :show" do
      get :show, id: contestant.id
      expect(response).to render_template(:show)
    end
  end

  
end
 