class Powiadomienie < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at,:confirm,:more, :more_confirm
  
  def self.current(hidden_ids=nil)
    result = Powiadomienie.where("starts_at <= :now and ends_at >= :now", now: Time.now)
    result = result.where("id not in (?)", hidden_ids) if hidden_ids.present?
    result
  end
end
