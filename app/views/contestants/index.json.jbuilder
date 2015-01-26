json.array!(@contestants) do |contestant|
  json.extract! contestant, :id, :name, :height, :weight
  json.url contestant_url(contestant, format: :json)
end
