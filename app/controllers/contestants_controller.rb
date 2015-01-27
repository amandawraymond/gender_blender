class ContestantsController < ApplicationController
  before_action :set_contestant, only: [:show, :edit, :update, :destroy]

  def index
    @contestants = Contestant.all
  end

  def show
    set_contestant
    get_gender_prediction
  end

  def correct_prediction
    set_contestant
    get_gender_prediction
    @test.save_prediction_as_trainer("correct")
  end

  def incorrect_prediction
    set_contestant
    get_gender_prediction
    @test.save_prediction_as_trainer("incorrect")
  end

  def new
    @contestant = Contestant.new
  end

  def edit
  end

  def create
    @contestant = Contestant.new(contestant_params)
    respond_to do |format|
      if @contestant.save
        format.html { redirect_to @contestant }
      else
        format.html { render :new }   
      end
    end
  end

  def update
    respond_to do |format|
      if @contestant.update(contestant_params)
        format.html { redirect_to @contestant }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contestant.destroy
    respond_to do |format|
      format.html { redirect_to contestants_url, notice: 'Contestant was successfully destroyed.' }
    end
  end

  private

    def get_gender_prediction
      contestant_data = @contestant
      @test           = GenderPredictionService.new(contestant_data)
      @prediction     = @test.prediction
    end

    def set_contestant
      @contestant = Contestant.find(params[:id])
    end

    def contestant_params
      params.require(:contestant).permit(:name, :height, :weight)
    end
end
