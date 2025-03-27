class RsvpsController < ApplicationController
  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    if @rsvp.save
      redirect_to root_path, notice: "Thank you for your RSVP!"
    else
      # Log errors for debugging (optional)
      puts "#{@rsvp.errors.any?} because error is #{@rsvp.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:first_name, :last_name, :email, :phone_number, :guests, :dietary_restrictions, :present)
  end
end
