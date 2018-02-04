class TravelStop < ApplicationRecord
  belongs_to :travel, optional: true

  # before_save :set_address
  # before_save :set_coordinates

  attr_writer :city
  attr_writer :zip_code
  attr_writer :desired_address

  def city
    @city ||= ""
  end

  def zip_code
    @zip_code ||= ""
  end

  def desired_address
    @desired_address ||= ""
  end

  private

  def set_coordinates
    if self.lat.nil?
      loc = nil
      if self.address
        loc = Geocoder.search(self.address)
      end
      unless loc.nil?
        self.lat = loc[0].latitude
        self.lng = loc[0].longitude
      end
    end
  end

  def set_address
    self.address = "#{@desired_address} #{@zip_code} #{@city}"
  end

end
