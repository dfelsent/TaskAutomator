class DoilistScrapeJob < Struct.new(:doilist_id)
  
  def perform
    doilist = Doilist.find(doilist_id)
    doilist.scrape
    Doilist.find(doilist_id).destroy
  end

  def max_attempts
    return 2
  end

end