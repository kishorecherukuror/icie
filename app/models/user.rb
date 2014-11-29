class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_validation :auto_password


  # role=>
  # 0=Employee
  # 1=Super Admin
  # 2=Hr
  # 3=Admin
  # 4=IT
  # 5=LnD
  # 6=Info Sec


  def auto_password
    self.password = Devise.friendly_token.first(8)
    self.password_confirmation=self.password
  end
  def role_s
    User.role_s(self.role)
  end
  def self.role_s(role)
    if role==0
      "Employee"
    elsif role==1
      "Super Admin"
    elsif role==2
      "HR"
    elsif role==3
      "Admin"
    elsif role==4
      "IT"
    elsif role==5
      "LnD"
    elsif role==6
      "Info Sec"
    end
        
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
