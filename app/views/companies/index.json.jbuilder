json.array!(@companies) do |company|
  json.extract! company, :name, :address, :allow_email_regex, :url
  json.url company_url(company, format: :json)
end
