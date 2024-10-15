class UsersController < ApplicationController
  def show
    @events_created = Event.where("creator_id = ?", current_user.id)
  end
end
