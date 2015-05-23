json.array!(@calender.events) do |event|
  json.extract! event, :id, :user_id, :start, :all_day, :end, :title
end
