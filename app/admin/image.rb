ActiveAdmin.register Image do
  belongs_to :channel, parent_class: Channel
end
