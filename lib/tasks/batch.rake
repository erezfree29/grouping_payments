namespace :batch do
  desc "TODO"
  task create_entities: :environment do
    Entity.create!(name:"burger",amount:2.5,author_id:1,occured:Time.now)
  end
end
