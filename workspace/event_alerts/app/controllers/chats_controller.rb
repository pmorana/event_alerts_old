class ChatsController < ApplicationController
	#http_basic_authenticate_with name: "Paul", password: "password", only: :destroy
	#attempt to restrict to only logged in users. Taken from the prelang generated code, works with Devise
	before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]


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
		params.require(:chat).permit(:user_name, :body)
	end
end
