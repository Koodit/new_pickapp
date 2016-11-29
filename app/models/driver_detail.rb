class DriverDetail < ApplicationRecord
  belongs_to :user

  ##### PATENTE
  has_attached_file :patente,
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
  validates_attachment_content_type :patente, :content_type => /\Aimage\/.*\Z/

  attr_writer :accept_terms_2
  attr_writer :accept_terms

  def accept_terms
    @accept_terms || false
  end

  def accept_terms_2
    @accept_terms_2 || false
  end
end
