class ImageDecorator < ApplicationDecorator
  delegate_all

  def file_decorate
    object.file.attached? ? object.file : '-'
  end

  def file_name
    object.file.attached? ? file_decorate.filename : '-'
  end

  def file_path
    if object.file.attached?
      ActiveStorage::Blob.service.path_for(file_decorate.key)
    else
      h.asset_path('default.png')
    end
  end

  def file_url?
    object.persisted? && object.file.attached?
  end

  def file_url
    if file_url?
      h.rails_representation_url(object.file)
    else
      h.asset_url('default.png')
    end
  end

  def cloudfront_url
    ""
    # cdn_image_url(variant(resize_to_limit: [128, 128]))
    # if file_url?
    #   "https://cdn-ordersnow.itcrowdapps.com/#{file.blob.key}"
    # else
    #   h.asset_url('default.png')
    # end
  end
end
