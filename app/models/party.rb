class Party < ApplicationRecord
	validates :title, presence: true, length: {in: 5..140}
	validates :description, presence: true, length: {in: 20..1000}
	validates :price, presence: true, inclusion: 1..1000
	validates :location, presence: true





	validates :start_date, presence: true, validates_with: is_in_the_past?
    private
      def is_in_the_past?(start_date)
        if start_date < Time.now
          	errors.add("The start date cannot be in the past!")
        	end
    	end
    end

    validates :duration, presence: true, numericality: { greater_than_or_equal_to: 5 }, validates_with: is_multiple_of_5?
    private
      def is_multiple_of_5?(duration)
      if duration%5 != 0
        errors.add("The duration must be a multiple of 5!")
      	end
	end




	has_many :participations
	has_many :users through: :participations
end

