class RoomCategory < ApplicationRecord
  # has_many :selected_room_categories
  # has_many :rooms, through: :selected_room_categories
  
  has_many :rooms
  
  has_many :selected_macro_categories
  has_many :macro_categories, through: :selected_macro_categories

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

  validates_presence_of :name
end
