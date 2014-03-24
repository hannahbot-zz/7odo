class Item < ActiveRecord::Base
  belongs_to :list

  default_scope { order('created_at DESC') }

  def countdown
    destroy_time = (user.item.created_at - Time.now)
  end

  def todays_tasks(now = Time.now)
    Task.find(:all, :conditions => ["starts_at > ? AND < ?", now.at_beginning_of_day, now.at_end_of_day])
  end

  #7.days.from_now
end
