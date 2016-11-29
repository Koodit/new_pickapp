class RoomFilter
  def initialize(params)
    @params = params || {}
  end

  def params
    @params
  end

  def flexible_departure
    return true if params[:flexible_departure] == "1"
    return false if params[:flexible_departure] == "0"
  end

  def can_repay
    return true if params[:can_repay] == "1"
    return false if params[:can_repay] == "0"
  end

  def can_smoke
    return true if params[:can_smoke] == "1"
    return false if params[:can_smoke] == "0"
  end

  def animals_allowed
    return true if params[:animals_allowed] == "1"
    return false if params[:animals_allowed] == "0"
  end

  def is_recursive
    return true if params[:is_recursive] == "1"
    return false if params[:is_recursive] == "0"
  end

  def min_departure_datetime
    params[:min_departure_datetime]
  end

  def max_departure_datetime
    params[:max_departure_datetime]
  end

  def towards_room
    params[:towards_room]
  end

end
