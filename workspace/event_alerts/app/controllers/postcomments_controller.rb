class PostcommentsController < ApplicationController
	
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
		params.require(:postcomment).permit(:user, :body)
	end
end
