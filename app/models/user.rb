class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :auto_password
  def auto_password
    self.password = Devise.friendly_token.first(8)
    self.password_confirmation=self.password
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :likes, :dependent => :destroy
         has_many :comments, :dependent => :destroy
         has_many :news, :through => :likes, :conditions =>"news.created_at BETWEEN datetime('now', 'start of month') AND datetime('now', 'localtime')"
         def full_name
         	"#{self.first_name rescue '' } #{self.middle_name rescue ''} #{self.last_name rescue''}"
         end
         has_attached_file :image,
           :storage => :dropbox,
           :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
           :styles => { :thumb => "200x110>", :medium => "420x235", :large => "660x370"},
           :default_url => '/assets/missing.png',
           :dropbox_options => {:path => proc { |style| "/news/photos/#{style}/#{id}_#{image.original_filename}" }}
           validates_attachment_size :image, :less_than => 5.megabytes
          validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']

end
