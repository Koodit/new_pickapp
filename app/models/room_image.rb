class RoomImage < ApplicationRecord
  belongs_to :room

  has_attached_file :image,
                      styles: {
                        thumb: '200x200>',
                        medium: '500x500#',
                        large: '1000x1000>'
                      },
                      default_url: "http://koodit.s3.amazonaws.com/pickapp/shared/sample/missing.png",
                      path: "pickapp/:class/:attachment/:id/:style/:filename.:extension",
                      preserve_files: "true",
                      url: ":s3_domain_url",
                      s3_region: "eu-west-1"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
