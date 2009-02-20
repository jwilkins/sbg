xml.instruct!
xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do
    xml.title       "CBT and Ball Busting"
    xml.link        @member_url
    #xml.pubDate     CGI.rfc1123_date(Date.strptime(@content_info.keys.sort.reverse.first[:date], "%m%d%y"))
    xml.description "Feed Description"

    @content_info.keys.sort.reverse.each do |k|
      xml.item do
        xml.title(@content_info[k][:title])
        xml.guid(@content_info[k][:dir])
        xml.link("#{@member_url}/#{@content_info[k][:dir]}")
        xml.description(@content_info[k][:desc])
        #xml.pubDate(CGI.rfc1123_date(Date.strptime(@content_info[k][:date], "%m%d%y")))
      end
    end
  end
end

