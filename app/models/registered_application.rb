class RegisteredApplication < ActiveRecord::Base
  belongs_to :user

  def events
    Event.where(registered_application: self)
  end

end
