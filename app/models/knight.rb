class Knight < ActiveRecord::Base

  def status_check
    if health > 5
      "Knight is carrying a #{weapon} and has #{health} health"
    else
      change_weapon_to('')
      "Knight has health of #{health} and needs the hospital!"
    end
  end

  def change_weapon_to(choice)
    if choice.is_a? String
      self.update_attributes(weapon: choice)
    end
  end

  def boost_health(factor = 50)
    new_health = health + factor
    self.update_attributes(health: new_health)
  end
end
