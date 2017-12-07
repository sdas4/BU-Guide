class Course < ActiveRecord::Base
    #validates_presence_of :abbrev, :name, :crn, :teacher
    validates :abbrev,  presence: true, format: { with: /CS+\s+\d{3}/, message: "must have the format 'CS XYZ' where XYZ is the three-digit course number" }, uniqueness: {message: " already exists"}
    validates :name,  presence: true, uniqueness: true
    validates :crn,  presence: true, length: { is: 6, wrong_length: " must be 6 digits long" }, uniqueness: true
end
