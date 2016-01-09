class PostcommentsController < ApplicationController
	
	#attempt to restrict to only logged in users. Taken from the prelang generated code, works with Devise
	before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

	def create
		@event = Event.find(params[:event_id])
		@postcomment = @event.postcomments.create(postcomment_params)
		redirect_to event_path(@event)
	end

	def destroy
		@event = Event.find(params[:event_id])
		@postcomment = @event.postcomments.find(params[:id])
		@postcomment.destroy
		redirect_to event_path(@event)
	end

private
	def postcomment_params
		params.require(:postcomment).permit(:user_name, :body)
	end
end
