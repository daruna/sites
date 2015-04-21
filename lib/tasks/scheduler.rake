desc 'This task check availability of all sites'
task check_site_availability: :environment do
  puts 'Checking sites availability...'
  CheckSiteAvailability.new.perform
  puts 'done.'
end
