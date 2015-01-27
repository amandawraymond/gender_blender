require 'spec_helper'

describe TrainersController, type: :controller do
  before do
    Trainer.destroy_all
  end
  let(:trainer) { FactoryGirl.create(:trainer) }
 

  describe "GET new" do
    it "assigns a new Trainer to @trainer" do
      get :new
      assigns(:trainer).should be_a_new(Trainer)
    end

    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "saves the new Trainer to @trainer" do
        expect{
          post :create, trainer:  FactoryGirl.attributes_for(:trainer) 
          }.to change(Trainer, :count).by(1)
      end
      
      it "redirects to :show" do
        post :create, trainer: FactoryGirl.attributes_for(:trainer) 
        last_trainer = Trainer.last
        expect(response).to redirect_to(trainer_path(last_trainer.id))
      end
    end
  
    context "with invalid gender attributes" do
      it "does not save the new Trainer to @trainer" do
         expect{
          post :create, trainer: FactoryGirl.attributes_for(:trainer, gender: "") 
        }.to_not change(Trainer, :count)
      end
    
      it "re-renders :new" do
        post :create, trainer: FactoryGirl.attributes_for(:trainer, gender: "") 
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET show" do
    let(:trainer) { FactoryGirl.create(:trainer) }
    
    it "assigns requested trainer to @trainer" do
      get :show, id: trainer.id
      assigns(:trainer).should eq(trainer)
    end
    
    it "renders :show" do
      get :show, id: trainer.id
      expect(response).to render_template(:show)
    end
  end

  
end
 