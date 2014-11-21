class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :likes, :dependent => :destroy
         has_many :comments, :dependent => :destroy

         def full_name
         	"#{self.first_name rescue '' } #{self.middle_name rescue ''} #{self.last_name rescue''}"
         	
         end
end
