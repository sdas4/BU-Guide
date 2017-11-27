Given /the following professors exist/ do |professors_table|
  professors_table.hashes.each do |professor|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that professor to the database here.
    Professor.create!(professor)
  end
end