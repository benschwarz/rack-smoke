# Pinched from github.com/benschwarz/benschwarz-site

require 'smoke'
require 'digest/sha1'

Smoke.configure do |c|
  c[:cache][:enabled] = true
  c[:cache][:store] = :memory
  c[:cache][:expire_in] = 1800
end

Smoke.yql(:flickr) do
  select :all
  from 'flickr.photos.search'
  where :user_id, "36821533@N00"
  where :tags, "germanforblack-site"

  path :query, :results, :photo
end

Smoke.data(:twitter) do
  prepare :require => :username do
    url "http://twitter.com/users/show.json?screen_name=#{username}", :format => :json  
  end
end

Smoke.feed(:delicious) do
  url "http://feeds.delicious.com/v2/rss/bschwarz?count=5"
end

Smoke.data(:upcoming) do
  url "http://upcoming.yahooapis.com/services/rest/?method=user.getWatchlist&api_key=7c06afe3f8&user_id=908522&show=upcoming&format=json"
  path :rsp, :event

  emit do
    keep :status, /attend/
    truncate 1
  end
end

Smoke.data(:github) do
  url "http://github.com/api/v2/json/repos/show/benschwarz"
  path :repositories
  
  emit do
    sort :watchers
    reverse
    truncate 5
  end
end

Smoke.data(:slideshare) do
  prepare do
    timestamp = Time.now.to_i
    hash = Digest::SHA1.hexdigest("FeXBxg0G#{timestamp}")
    url "http://www.slideshare.net/api/2/get_slideshows_by_user?username_for=benschwarz&api_key=uQqJ57cz&ts=#{timestamp}&hash=#{hash}"
  end
  
  path :User, :Slideshow
end