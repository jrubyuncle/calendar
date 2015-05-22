json.array!(@admin_calenders) do |admin_calender|
  json.extract! admin_calender, :id, :user_id, :name, :public
  json.url admin_calender_url(admin_calender, format: :json)
end
