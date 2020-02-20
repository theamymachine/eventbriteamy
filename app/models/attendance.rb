class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :confirmation_send

  def confirmation_send
    AttendanceMailer.confirmation(self).deliver_now
  end

end
