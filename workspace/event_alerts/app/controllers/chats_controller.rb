class ChatsController < ApplicationController
	#http_basic_authenticate_with name: "Paul", password: "password", only: :destroy

	def create
		@event = Event.find(params[:event_id])
		@chat = @event.chats.create(chat_params)
		redirect_to event_path(@event)
	end

	def destroy
		@event = Event.find(params[:event_id])
		@chat = @event.chats.find(params[:id])
		@chat.destroy
		redirect_to event_path(@event)
	end

private
	def chat_params
		params.require(:chat).permit(:user, :body)
	end
end
