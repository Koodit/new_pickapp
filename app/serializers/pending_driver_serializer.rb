class PendingDriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :email, :patente, :license_type, :license_number, :license_release_date, :license_expire_date, :license_release_city, :driver_detail_id

  def driver_detail_id
    object.driver_detail.id
  end

  def patente
    object.driver_detail.patente.url
  end

  def license_type
    object.driver_detail.license_type
  end

  def license_number
    object.driver_detail.license_number
  end

  def license_release_date
    object.driver_detail.license_release_date
  end

  def license_expire_date
    object.driver_detail.license_expire_date
  end

  def license_release_city
    object.driver_detail.license_release_city
  end

  def assicurazione
    object.driver_detail.assicurazione.url
  end
end
