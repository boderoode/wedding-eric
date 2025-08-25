class Rsvp < ApplicationRecord
  attr_accessor :admin_created

  validates :first_name, presence: { message: "This field can't be blank" }, unless: :admin_created
  validates :last_name, presence: { message: "This field can't be blank" }, unless: :admin_created
  validates :present, inclusion: { in: [ true, false ], message: "must be selected" }, unless: :admin_created_or_placeholder

  private

  def admin_created_or_placeholder
    admin_created || (email.blank? && phone_number.blank? && present.nil?)
  end
end
