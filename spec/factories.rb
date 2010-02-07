Factory.define :user do |f|
  f.sequence(:first_name) { |n| "joe#{n}" }
  f.sequence(:last_name) { |n| "joe#{n}" }
  f.sequence(:email) { |n| "foo#{n}@example.com" }
  f.password "foobar"
  f.password_confirmation { |u| u.password }
end


  
