class StaticPagesController < ApplicationController

  def home
    @textbox = current_user.textboxes.build if logged_in?
  end
end