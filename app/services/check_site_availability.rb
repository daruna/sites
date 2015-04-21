class CheckSiteAvailability
  def perform
    Site.find_each do |site|
      available = site.available?
      site.update_attributes!(available: available, updated_at: Time.zone.now)
    end
  end
end
