class Commontable < ActiveRecord::Base
	belongs_to :parent_table, polymorphic: true
	 has_attached_file :image,
           :storage => :dropbox,
           :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
           :styles => { :thumb => "200x110>", :medium => "420x235", :large => "660x370"},
           :default_url => '/assets/missing.png',
           :dropbox_options => {:path => proc { |style| "/news/photos/#{style}/#{id}_#{image.original_filename}" }}
           validates_attachment_size :image, :less_than => 5.megabytes
          validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']

end
