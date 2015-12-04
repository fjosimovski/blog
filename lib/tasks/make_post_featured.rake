desc "Make a random post featured"
task :make_post_featured => :environment do
  puts "Making a random post featured"
  FeaturedPostWorker.new.perform
  puts "done."
end
