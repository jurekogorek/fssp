
class User < ActiveRecord::Base
  has_and_belongs_to_many :roles,:join_table => :users_roles
  attr_accessible :name, :title, :login, :password, :password_confirmation
  validates :password,:confirmation=>true
  attr_accessor :password_confirmation
  attr_reader :password

#  validate :password_must_be_present

  class << self
    def authenticate(name,password)
      return nil if name.nil? or name == ""
         puts "\n\n\n name #{name} name \n\n\n"
      if user = User.find_by_login(name)

        puts "\n\n\n name #{user.id} #{user.name} name \n\n\n"

        if user.hashed_password == encrypt_password(password, user.salt)
          user
        end
      end
    end
 
    def encrypt_password(password,salt)
    Digest::SHA2.hexdigest(password+"engel"+salt)
  end
  end
  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password,salt)
    end
  end

 def has_role(r)
    self.roles.where(:name=>r).first
  end

 def self.users
  User.order('name').map{|u| ["#{u.title} #{u.name}",u.id] }
 end


 def full_name
   "#{title} #{name}"
 end


  private

  def password_must_be_present
    errors.add(:password,"Missing password") unless hashed_password.present?
  end



  def generate_salt
    self.salt = self.object_id.to_s+ rand.to_s
  end



end
