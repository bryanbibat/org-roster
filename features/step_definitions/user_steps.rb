Given(/^no #{capture_plural_factory} exist$/) do |plural_factory|
  plural_factory.classify.constantize.destroy_all
  # you could add the following to verify that there are indeed no records
  find_models(plural_factory.singularize).should be_empty
end
