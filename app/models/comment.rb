class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :news
	after_save :increment_employee_points
	def increment_employee_points
		user=self.user
		user.points=user.points+self.news.points
		user.save
	end
end
