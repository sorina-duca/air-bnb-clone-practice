class MessagesController < ApplicationController
  before_action :set_conversation
  skip_before_action :authenticate_user!, only: :index
  skip_after_action :verify_policy_scoped, only: :index
  before_action :authenticate_user!

  def index
    @message = Message.new
    @messages = @conversation.messages
  end

  def new
    @message = @conversation.messages.new
    authorize @message
  end

  def create
    @message = @conversation.messages.new(message_params)
    authorize @message
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
