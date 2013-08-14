class Event < ActiveRecord::Base
	validates :date, presence: true, :if => :valid_date?
	validates :title, presence: true, uniqueness: true
	validates :organizer_name, presence: true
	validates :organizer_email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}

	def valid_date?
  	if self.date.nil? || self.date < Time.now.to_date
    	errors.add(:date, "must be a future date")
    	return false
  	end	
  end
  
end
