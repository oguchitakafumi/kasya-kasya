class TextboxesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
      @textbox = current_user.textboxes.build(textbox_params)
      if @textbox.save
          flash[:success] = "Take Pic!"
          redirect_to root_url
      else
          render 'static_pages/home'
      end
  end

     private

     def textbox_params
         params.require(:textbox).permit(:content)
     end
end

