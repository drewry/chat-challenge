class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show]

  def index
    @messages = Message.all.order(:created_at)
  end

  def show
  end

  def create
    @message = current_user.messages.create message_params

    if @message
      render :show, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
    def set_message
      if Message.where(id: params[:id]).exists?
        @message = Message.find(params[:id])
      else
        render json: { message: "Message not found" }, status: :not_found
      end
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
