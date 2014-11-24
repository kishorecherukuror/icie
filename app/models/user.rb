class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

 
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  before_validation :auto_password
  def auto_password
    self.password = Devise.friendly_token.first(8)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :likes, :dependent => :destroy
         has_many :comments, :dependent => :destroy

         def full_name
         	"#{self.first_name rescue '' } #{self.middle_name rescue ''} #{self.last_name rescue''}"
         end
end
