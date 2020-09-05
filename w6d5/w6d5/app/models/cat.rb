require 'action_view'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :name, :color,  :description, :sex, :birth_date, presence: true

    validates :color, inclusion: { in: %w(white orange brown black polka-dot),message:"Is not a Valid Color"  }
    
    THE_SEXES = ['M','F']
    validates :sex, inclusion: {in: THE_SEXES, message: "%{value} Isn't a sex for kitty cats"}

    def age
        time_ago_in_words(birth_date)  
    end

end
# dd-mm-yyyy



# class Coffee < ApplicationRecord
#     validates :size, inclusion: { in: %w(small medium large),
#       message: "%{value} is not a valid size" }
# end