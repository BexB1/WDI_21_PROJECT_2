class Pledge < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :sponsor, class_name: "User", foreign_key: "sponsor_id"
  belongs_to :category

  include PublicActivity::Model
  tracked

  tracked owner: Proc.new { |controller, model| !controller.nil? && controller.current_user ? controller.current_user : nil }


  def first_checkin
    if self.daily_post == nil
      self.daily_post = self.created_at
    end
  end
    
  def is_failed?
    first_checkin
    self.daily_post < (Time.now.utc.in_time_zone('Europe/London').beginning_of_day - 1.day)
  end

  def has_won?
    days_won == 30 && !is_failed?
  end

  def is_closed?
    has_won? || is_failed?
  end

  def days_won
    
    if self.daily_post == nil
      self.daily_post = self.created_at
    end

    (self.daily_post - self.created_at).to_i / (24 * 60 * 60)

  end

  def self.test

  end

end
