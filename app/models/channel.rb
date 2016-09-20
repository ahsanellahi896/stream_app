class Channel < ActiveRecord::Base
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image

  def self.set_json(channel, similar_channels)
    {
      channel: {
        category: channel.category,
        name: channel.name,
        embed_code: channel.embed_code,
        image: channel.image && channel.image.photo.url
      },
      similar_channels: similar_channels.collect do |similar_channel|
                          {
                            category: similar_channel.category,
                            name: similar_channel.name,
                            embed_code: similar_channel.embed_code,
                            image: similar_channel.image && similar_channel.image.photo.url
                          }
                        end
    }
  end

  def self.all_by_category_json(channels_by_category)
    {
      channels: channels_by_category.collect do |category, channels|
                  {
                    category => channels.collect do |channel|
                                  {
                                    id: [(0..3).map{ (48 + rand(10)).chr }.join, channel.id, (0..3).map { (48 + rand(10)).chr }.join].join,
                                    name: channel.name,
                                    category: channel.category,
                                    embed_code: channel.embed_code,
                                    image: channel.image && channel.image.photo.url
                                  }
                                end
                  }
                end
    }
  end
end
