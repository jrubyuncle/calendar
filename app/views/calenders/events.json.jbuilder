json.array!(@calender.events) do |event|
  json.extract! event, :id, :user_id, :start, :end, :title
  json.allDay event.all_day
end
