class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])

    @similar_channels = Channel.where(category: @channel.category)
  end
end
