class LyricSender
  def initialize(plumbing_adapter)
    @plumbing_adapter=plumbing_adapter
    @plumbing_adapter.register_topic('data-stream-topic')
  end

  def send_job

    # lyrics = ['Gustavus', 'Adolphus', 'Libera', 'et', 'impera', 'Acerbus', 'et', 'ingens', 'Augusta', 'per', 'augusta']
	lyrics = %w()

    lyrics.each do |lyric|
      @plumbing_adapter.send_message('data-stream-topic','{"message":"lyric", "lyric":"' + lyric + '"}')
      sleep(5)
    end

  end

  def stop
    @plumbing_adapter.close
  end
end