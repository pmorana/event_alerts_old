class PrecommentsController < ApplicationController
	#attempt to restrict to only logged in users. Taken from the prelang generated code, works with Devise
	before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]
	
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
		params.require(:precomment).permit(:user_name, :body)
	end
end
