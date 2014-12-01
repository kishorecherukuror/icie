class Document < ActiveRecord::Base
	has_one :commontable, as: :parent_table, :dependent => :destroy
	accepts_nested_attributes_for :commontable
end
