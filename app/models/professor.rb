class Professor < ActiveRecord::Base
    #validates_presence_of :name, :office, :classes
    validates :name,  presence: true, uniqueness: {message: " already exists"}
    validates :office,  presence: true
    validates :classes, allow_blank: true, format: { with: /CS+\s+\d{3}/, message: "must have the format 'CS XYZ' where XYZ is the three-digit course number" }
end
