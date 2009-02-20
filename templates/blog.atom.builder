xml.instruct! :xml, :version=>"1.0"
xml.feed(:xmlns => "http://www.w3.org/2005/Atom") do |feed|
  feed.title('CBT and Ball Busting')
  feed.link(@member_url)
  @content_info.keys.sort.reverse.each { |k|
    feed.entry do |entry|
      entry.id(@content_info[k][:dir])
      entry.link("#{@member_url}/#{@content_info[k][:dir]}")
      entry.title(@content_info[k][:title])
      entry.updated(@content_info[k][:date])
      entry.content(@content_info[k][:desc], :type => 'text')
    end
  }
end
