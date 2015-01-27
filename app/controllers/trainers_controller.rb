class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]

  def index
    @trainers = Trainer.all
  end

  def show
  end

  def new
    @trainer = Trainer.new
  end

  def edit
  end

  def create
    @trainer = Trainer.new(trainer_params)

    respond_to do |format|
      if @trainer.save
        format.html { redirect_to @trainer}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @trainer.update(trainer_params)
        format.html { redirect_to @trainer }
      else
        format.html { render :edit }  
      end
    end
  end

  def destroy
    @trainer.destroy
    respond_to do |format|
      format.html { redirect_to trainers_url, notice: 'Trainer was successfully destroyed.' }
    end
  end


  private
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    def trainer_params
      params.require(:trainer).permit(:gender, :weight, :height)
    end
end
