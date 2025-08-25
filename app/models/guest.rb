class Guest < ApplicationRecord
  belongs_to :rsvp

  validates :first_name, presence: { message: "First name can't be blank" }
  validates :last_name, presence: { message: "Last name can't be blank" }

  def full_name
    "#{first_name} #{last_name}"
  end
end
