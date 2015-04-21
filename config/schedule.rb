every 5.minutes do
   runner 'CheckSiteAvailability.new.perform', output: 'log/cron.log'
end
