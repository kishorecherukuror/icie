class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :news
	after_save :increment_news_points

	def increment_news_points
		news=self.news
		news.points=news.points+1
		news.save
	end
end
