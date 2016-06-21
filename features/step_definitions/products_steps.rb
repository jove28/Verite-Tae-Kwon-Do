#assign bacground
Given /^the following products exist:$/ do |table|
  table.map_headers! {|header| header.downcase.to_sym }

  table.hashes.each  do |product|
     Product.create!(product)
  end
end

Then /^I submit the "([^\"]*)" form$/ do |form_id|
  submit_form form_id
end

When /^I upload an image "([^\"]*)"$/ do |path|
  attach_file("image_field", path)
  #click_button "Choose"
end