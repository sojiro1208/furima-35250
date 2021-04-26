# メッセージのコントローラー

class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    # @message = Message.new(text:params[:message][:text])
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, user: @message.user, time: @message.created_at.to_s(:datetime_jp)
    end
  end


  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
