class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.roles_for_select
    Role.order(:name).map{|m| [m.name,m.id]}
  end
end
