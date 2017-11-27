class Professor < ActiveRecord::Base
    validates_presence_of :name, :office, :classes
end
