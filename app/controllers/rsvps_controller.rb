

class RsvpsController < ApplicationController
  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    full_name = "#{@rsvp.first_name.to_s.strip} #{@rsvp.last_name.to_s.strip}".squeeze(" ")
    unless InviteeList.list.any? { |invitee| invitee.downcase == full_name.downcase }
      @rsvp.errors.add(:base, "The name you entered is not on the invite list. Please check your spelling or contact the couple if you believe this is a mistake.")
      render :new, status: :unprocessable_entity
      return
    end
    if @rsvp.save
      redirect_to root_path, notice: "Thank you for your RSVP!"
    else
      puts "#{@rsvp.errors.any?} because error is #{@rsvp.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:first_name, :last_name, :email, :phone_number, :present)
  end
end
