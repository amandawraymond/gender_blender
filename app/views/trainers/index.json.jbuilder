json.array!(@trainers) do |trainer|
  json.extract! trainer, :id, :gender, :weight, :height
  json.url trainer_url(trainer, format: :json)
end
