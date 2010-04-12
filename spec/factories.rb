Factory.define :user do |f|
  f.sequence(:first_name) { |n| "joe#{n}" }
  f.sequence(:last_name) { |n| "joe#{n}" }
  f.sequence(:email) { |n| "foo#{n}@example.com" }
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.batch_id 1
end

Factory.define :batch do |f|
  f.name "founding"
  f.applicant_batch 0
  f.year 2000
end
  
