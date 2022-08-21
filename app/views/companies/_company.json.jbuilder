json.extract! company, :id, :business_name, :street_address, :phone_number, :city, :working_days, :meta_data, :created_at, :updated_at
json.url company_url(company, format: :json)
