class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])

    @similar_channels = Channel.where(category: @channel.category)

    respond_to do |format|
      format.html
      format.json { render json: Channel.set_json(@channel, @similar_channels) }
    end
  end

  def all_by_category
    render json: Channel.all_by_category_json(Channel.all.group_by(&:category))
  end
end
