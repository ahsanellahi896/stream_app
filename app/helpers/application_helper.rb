module ApplicationHelper
  def channel_image_path(channel)
    channel.image && channel.image.photo.url || 'http://placehold.it/400x300'
  end
end
