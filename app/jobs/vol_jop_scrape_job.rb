class VolJopScrapeJob < Struct.new(:vol_jop_id)
  
  def perform
    vol = VolJop.find(vol_jop_id)
    vol.scrape
    VolJop.find(vol_jop_id).destroy
  end

  def max_attempts
    return 1
  end

   def failure(job)
  	VolJop.destroy_all
  end

end