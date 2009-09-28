Smoke.configure do |c|
  c[:cache][:enabled] = true
  c[:cache][:store] = :memory
  c[:cache][:expire_in] = 1800
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