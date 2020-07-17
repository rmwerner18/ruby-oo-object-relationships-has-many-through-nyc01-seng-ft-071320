class Waiter 
    attr_accessor :name, :yrs_experience
    
    @@all = []
    
    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end
    
    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        best_tip_meal = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
        best_tip_meal.customer   
    end

    def most_frequent_customer
        customer_count = {}
        meals.map do |meal|
            customer_count[:meal.customer] ||= 0
            customer_count[:meal.customer] += 1
        end
        customer_count.max_by {|key,value| v}
    end
end