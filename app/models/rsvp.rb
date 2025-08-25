class Rsvp < ApplicationRecord
  attr_accessor :admin_created

  validates :first_name, presence: { message: "This field can't be blank" }, unless: :admin_created
  validates :last_name, presence: { message: "This field can't be blank" }, unless: :admin_created
  validates :email, presence: { message: "This field can't be blank" }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { message: "This email has already been taken" }, unless: :admin_created_or_placeholder
  validates :phone_number, presence: { message: "This field can't be blank" }, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }, uniqueness: { message: "This phone number has already been taken" }, unless: :admin_created_or_placeholder
  validates :present, inclusion: { in: [ true, false ], message: "must be selected" }, unless: :admin_created_or_placeholder

  private

  def admin_created_or_placeholder
    admin_created || (email.blank? && phone_number.blank? && present.nil?)
  end
end
