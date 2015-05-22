json.array!(@calenders) do |calender|
  json.extract! calender, :id, :user_id, :name, :public
  json.url calender_url(calender, format: :json)
end
