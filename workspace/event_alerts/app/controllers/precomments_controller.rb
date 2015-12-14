class PrecommentsController < ApplicationController
	
	def create
		@event = Event.find(params[:event_id])
		@precomment = @event.precomments.create(precomment_params)
		redirect_to event_path(@event)
	end

	def destroy
		@event = Event.find(params[:event_id])
		@precomment = @event.precomments.find(params[:id])
		@precomment.destroy
		redirect_to event_path(@event)
	end

private
	def precomment_params
		params.require(:precomment).permit(:user, :body)
	end
end
