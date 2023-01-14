json.extract! trnsaction, :id, :name, :amount, :created_at, :updated_at
json.url trnsaction_url(trnsaction, format: :json)
