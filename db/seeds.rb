# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


courses = [{:abbrev => 'CS 545', :name => 'Software Engineering', :crn => '######'},
            {:abbrev => 'CS 550', :name => 'Operating Systems', :crn => '######'},
            {:abbrev => 'CS 555', :name => 'Visual Processing', :crn => '######'},
  	 ]
  	 
  	 
courses.each do |course|
    Course.create!(course)
end

