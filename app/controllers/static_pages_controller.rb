class StaticPagesController < ApplicationController
  def home
    @channels_by_category = Channel.all.group_by(&:category)
  end
end
