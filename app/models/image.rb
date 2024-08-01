class Image < ApplicationRecord
  include Api::V1::Jsons::Image

  #--------------------------------------------- RELATION
  belongs_to :imageable, polymorphic: true
  has_one_attached :file

  #--------------------------------------------- MISC

  #--------------------------------------------- VALIDATION
  validate :acceptable_file

  #--------------------------------------------- CALLBACK
  before_destroy :invalidate_cloudfront_cache

  #--------------------------------------------- SCOPES
  scope :order_default, -> { order('images.id DESC') }

  #--------------------------------------------- METHODS
  def to_s
    "\##{id} - Image"
  end

  def acceptable_file
    return unless file.attached?

    errors.add(:file, I18n.t('errors.messages.file_too_big', size: '3 MB')) unless file.byte_size <= 3.megabyte

    acceptable_types = ['image/png', 'image/jpg', 'image/jpeg']
    return if acceptable_types.include?(file.content_type)

    errors.add(:file, I18n.t('errors.messages.must_be', formats: 'png, jpg, jpeg'))
  end

  private

  def invalidate_cloudfront_cache
    client = Aws::CloudFront::Client.new(region: ENV['AWS_CLOUDFRONT_DISTRIBUTION_REGION'])

    paths = ["/#{file.blob.key}"]
    invalidation = client.create_invalidation({
      distribution_id: ENV['AWS_CLOUDFRONT_DISTRIBUTION_ID'],
      invalidation_batch: {
        paths: {
          quantity: paths.size,
          items: paths,
        },
        caller_reference: Time.now.to_i.to_s,
      }
    })
    # invalidation.id
  end
end
