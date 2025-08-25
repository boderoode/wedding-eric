class AdminController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @rsvps = Rsvp.all.order(:created_at)
    @accepted_rsvps = @rsvps.where(present: true)
    @declined_rsvps = @rsvps.where(present: false)
    @total_guests = @accepted_rsvps.includes(:guests).sum { |rsvp| rsvp.guests.count + 1 }
  end
end
