class VolScrapeJob < Struct.new(:vol_id)
  
  def perform
    vol = Vol.find(vol_id)
    vol.scrape
    Vol.find(vol_id).destroy
  end

  def max_attempts
    return 2
  end

end