class StaticPagesController < ApplicationController
  before_action :authenticate_admin_user!
  def home
    @channels_by_category = Channel.all.group_by(&:category)

    respond_to do |format|
      format.html
      format.json { render json: @channels_by_category }
    end
  end
end
