class BadgeWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 0

  def perform(user_id, badge_category, options = {})
    case badge_category
    when "SocialMasterBadge"
      social_master_badge_for_users(options["driver_id"], options["passenger_id"])
    when "CitizenBadge"
      citizen_badge_for_user(user_id)
    end
  end

  def social_master_badge_for_users(driver_id, passenger_id)
    puts "social master badge for users, driver: #{driver_id} & passenger: #{passenger_id}"
    driver = User.find(driver_id)
    passenger = User.find(passenger_id)

    if driver.social_master_badge.nil?
      puts "creato social master badge per driver"
      social_master_badge = SocialMasterBadge.create user_id: driver_id
      driver.social_master_badge = social_master_badge
    end

    if passenger.social_master_badge.nil?
      puts "creato social master badge per passenger"
      social_master_badge = SocialMasterBadge.create user_id: passenger_id
      passenger.social_master_badge = social_master_badge
    end

    unless driver.social_master_badge.social_master_badge_relations.any?{|smbr| smbr.user_id == passenger_id}
      puts "non esisteva relazione, crea per entrambi"

      if !driver.social_master_badge.completed
        smbr_for_driver = SocialMasterBadgeRelation.create user_id: passenger_id, social_master_badge_id: driver.social_master_badge.id
        driver.social_master_badge.relations_count += 1
        driver.social_master_badge.completion_percentage = driver.social_master_badge.relations_count * 100 / 100
        if driver.social_master_badge.completion_percentage = 100.0
          driver.social_master_badge.completed = true
        end
        driver.social_master_badge.save
      end

      if !passenger.social_master_badge.completed
        smbr_for_passenger = SocialMasterBadgeRelation.create user_id: driver_id, social_master_badge_id: passenger.social_master_badge.id
        passenger.social_master_badge.relations_count += 1
        passenger.social_master_badge.completion_percentage = passenger.social_master_badge.relations_count * 100 / 100
        if passenger.social_master_badge.completion_percentage = 100.0
          passenger.social_master_badge.completed = true
        end
        passenger.social_master_badge.save
      end

    end
  end

  def citizen_badge_for_user(user_id)
    user = User.find(user_id)
    if user.citizen_badge.nil?
      CitizenBadge.create user_id:user_id, travel_count: 1, completion_percentage: 20
    else
      if !user.citizen_badge.completed
        user.citizen_badge.travel_count += 1
        user.citizen_badge.completion_percentage = user.citizen_badge.travel_count * 100 / 5
        if user.citizen_badge.completion_percentage == 100
          user.citizen_badge.completed = true
        end
        user.citizen_badge.save
      end
    end
  end

end
