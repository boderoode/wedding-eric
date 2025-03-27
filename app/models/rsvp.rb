class Rsvp < ApplicationRecord
  validates :first_name, presence: { message: "This field can't be blank" }
  validates :last_name, presence: { message: "This field can't be blank" }
  validates :email, presence: { message: "This field can't be blank" }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { message: "This email has already been taken" }
  validates :phone_number, presence: { message: "This field can't be blank" }, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }, uniqueness: { message: "This phone number has already been taken" }
  validates :present, inclusion: { in: [ true, false ], message: "must be selected" }
  validates :guests, presence: { message: "This field can't be blank" }, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be a number" }
end
