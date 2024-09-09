# frozen_string_literal: true

class Meeting
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  field :start_time, type: Time
  field :end_time, type: Time

  validate :time_validation

  private

  def time_validation
    if start_time.is_a?(Time) && end_time.is_a?(Time)
      meetings = Meeting.all
      meetings.each do |m|
        next unless ((start_time >= m.start_time && start_time <= m.end_time) ||
          (end_time >= m.start_time && end_time <= m.end_time)) ||
                    ((m.start_time >= start_time && m.start_time <= end_time) ||
                    (m.end_time >= start_time && m.end_time <= end_time))

        errors.add(:time_validation, 'selected date/time slot is already taken.')
      end
    else
      errors.add(:time_validation, 'please provide a valid date/time')
    end
  end
end
