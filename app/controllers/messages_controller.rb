class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.order("created_at desc")
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        @messages = Message.order("created_at desc")
        format.html { render action: 'index' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:author, :message)
    end
end
