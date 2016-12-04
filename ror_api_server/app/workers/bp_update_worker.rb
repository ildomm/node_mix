class BPUpdateWorker
  include Sidekiq::Worker

  def perform( url )
    @source_url = url
    get_data
    parse
    upsert
  end

  def get_data
    require 'open-uri'
    @data = URI.parse(@source_url).read
  end

  def parse
    @elements = JSON.parse(@data)
  end

  def upsert
    @elements['content'].each { |element|
      obj = Bpclient.collection.find({id: element['id']})
      if obj.count > 0
        obj.update_one(element)
      else
        Bpclient.collection.insert_one(element)
      end
    }
  end

end