# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


courses = [{:abbrev => 'CS 550', :name => 'Operating Systems', :crn => '29222', :teacher => "Kartik Gopalan"},
            {:abbrev => 'CS 555', :name => 'Visual Processing', :crn => '10965', :teacher => "Lijun Yin"},
            {:abbrev => 'CS 545', :name => 'Software Engineering', :crn => '26804', :teacher => "Rose M Williams"},
  	 ]
  	 
  	 
courses.each do |course|
    Course.create!(course)
end

professors = [{:name => 'Rose M Williams', :office => 'EB-Q06', :classes => 'CS 545'},
                {:name => 'Kartik Gopalan', :office => 'Q-22', :classes => 'CS 550'},
                {:name => 'Lijun Yin', :office => 'Q-22', :classes => 'CS 555'},
    ]

professors.each do |professor|
    Professor.create!(professor)
end


users = [{:username => 'sujoy_das', :password => 'sdas4', :emailID => 'sdas4@binghamton.edu'},
{:username => 'kshitija_patil', :password => 'kpatil6', :emailID => 'kpatil6@binghamton.edu'},
{:username => 'nirmal_kumar', :password => 'nbaskar1', :emailID => 'nbaskar1@binghamton.edu'},
{:username => 'stephen_molaro', :password => 'smolaro1', :emailID => 'smolaro1@binghamton.edu'},
{:username => 'jarrod_stone', :password => 'jstone1', :emailID => 'jstone1@binghamton.edu'},
    ]

users.each do |user|
    User.create!(user)
end