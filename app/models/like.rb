class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :news
	after_save :increment_news_points
	validates_uniqueness_of :user_id, :scope => :news_id

	def increment_news_points
		news=self.news
		news.points=news.points+1
		news.save
	end
end
