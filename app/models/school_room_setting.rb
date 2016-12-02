class SchoolRoomSetting < ApplicationRecord
  belongs_to :room

  before_create :set_share_link

  def set_share_link
    set_code
    self.share_link = "#{Rails.application.secrets.app_host}/#/sign_up/school/#{self.code}"
  end

  def set_code
    self.code = rand(36**16).to_s(36)
  end
end
