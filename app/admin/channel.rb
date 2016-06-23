ActiveAdmin.register Channel do
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :category
    column :embed_code
    column 'Thumbnail' do |channel|
      if channel.image.present?
        image_tag(channel.image.photo.url(:thumb))
      else
        'No Thumbnail'
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |channel|
    attributes_table do
      row :id
      row :name
      row :description
      row :category
      row :embed_code
      row :image do
        channel.image.present? ? image_tag(channel.image.photo.url(:thumb)) : content_tag(:span, 'No logo yet')
      end
    end

    active_admin_comments
  end

  controller do
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id, channel: [:name, :description, :category, :embed_code, image_attributes: [:photo]]
    end
  end

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :category, as: :select, collection: %w(news business sports general), include_blank: false
      f.input :embed_code
      f.has_many :image, allow_destroy: true do |ff|
        ff.input :photo, as: :file, hint: ff.object.photo.url ? image_tag(ff.object.photo.url(:medium)) : ''
      end
    end

    f.actions
  end
end
