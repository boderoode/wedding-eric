class Admin::RsvpsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rsvp, only: [ :show, :edit, :update, :destroy ]

  def index
    @invitees = InviteeList.list.map do |name|
      parts = name.split(" ")
      first_name = parts.first
      last_name = parts[1..-1].join(" ") # Handle names with multiple last names

      # Find existing RSVP for this person
      rsvp = Rsvp.find_by("LOWER(first_name) = ? AND LOWER(last_name) = ?",
                          first_name.downcase, last_name.downcase)

      {
        name: name,
        first_name: first_name,
        last_name: last_name,
        rsvp: rsvp,
        status: rsvp ? (rsvp.present? ? "attending" : "declined") : "pending"
      }
    end.sort_by { |invitee| [ invitee[:last_name], invitee[:first_name] ] }

    @rsvps = Rsvp.all.order(:created_at)
    @accepted_rsvps = @rsvps.where(present: true)
    @declined_rsvps = @rsvps.where(present: false)
    @pending_count = @invitees.count { |i| i[:status] == "pending" }
    @total_guests = @accepted_rsvps.sum(:guests) + @accepted_rsvps.count
    @total_invitees = @invitees.count
  end

  def show
  end

  def new
    @rsvp = Rsvp.new
    # Pre-populate with invitee data if coming from index
    @rsvp.first_name = params[:first_name] if params[:first_name]
    @rsvp.last_name = params[:last_name] if params[:last_name]
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      redirect_to admin_rsvps_path, notice: "RSVP was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rsvp.update(rsvp_params)
      redirect_to admin_rsvps_path, notice: "RSVP was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @rsvp.destroy
    redirect_to admin_rsvps_path, notice: "RSVP was successfully deleted."
  end

  private

  def set_rsvp
    @rsvp = Rsvp.find(params[:id])
  end

  def rsvp_params
    params.require(:rsvp).permit(:first_name, :last_name, :email, :phone_number, :present)
  end
end
