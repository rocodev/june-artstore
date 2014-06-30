namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed" ]

  desc "create_base_category"
  task :demo => :environment do
    for i in 1..10 do 
      Category.create!(:name => "Category #{n}")
    end
  end
end