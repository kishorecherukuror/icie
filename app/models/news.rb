class News < ActiveRecord::Base
	#validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	# has_attached_file :image,
 #  	:storage => :dropbox,
 #    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
 #    :dropbox_options => {}
 # has_attached_file :image_a, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 #  validates_attachment_content_type :image_a, :content_type => /\Aimage\/.*\Z/
 has_attached_file :image_a,
     :storage => :dropbox,
     :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
     :styles => { :thumb => "200x110>", :medium => "420x235", :large => "660x370"},
     :default_url => '/assets/missing.png',
     :dropbox_options => {:path => proc { |style| "/news/photos/#{style}/#{id}_#{image_a.original_filename}" }}
     validates_attachment_size :image_a, :less_than => 5.megabytes
  	validates_attachment_content_type :image_a, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  	has_many :likes
  	has_many :comments
  	

  	def is_liked(user)
  		if self.likes.collect(&:user_id).include?(user.id)
  			true
  		else
  			false
  		end

  	end
end
