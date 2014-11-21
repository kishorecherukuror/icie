class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :news
	after_save :increment_employee_points
	validates_uniqueness_of :user_id, :scope => :news_id

	def increment_employee_points
		user=self.user
		user.points=user.points+self.news.points
		user.save
	end
end
