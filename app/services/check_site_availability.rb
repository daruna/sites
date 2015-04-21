class CheckSiteAvailability
  def perform
    Site.find_each do |site|
      available = site.available?
      site.update_attributes(available: available)
    end
  end
end
