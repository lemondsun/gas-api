class TelebotsController < ApplicationController
  before_action :set_telebot, only: [:show, :update, :destroy]

  # GET /telebots
  def index
    @telebots = Telebot.all

    render json: @telebots
  end

  # GET /telebots/1
  def show
    render json: @telebot
  end

  # POST /telebots
  def create
    @telebot = Telebot.new(telebot_params)

    if @telebot.save
      render json: @telebot, status: :created, location: @telebot
    else
      render json: @telebot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /telebots/1
  def update
    if @telebot.update(telebot_params)
      render json: @telebot
    else
      render json: @telebot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /telebots/1
  def destroy
    @telebot.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telebot
      @telebot = Telebot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def telebot_params
      params.require(:telebot).permit(:chatId, :price)
    end
end
