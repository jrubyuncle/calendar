namespace :dev do
  task fake: %i[db:reset environment] do
    user = User.create! email: 'hello@test.com', password: 'password'
    calender = user.calenders.create! name: '我的日曆', public: true
    5.times do
      day = rand(10).days.ago.beginning_of_day
      calender.events.create!(
        title: Faker::Lorem.sentence, calender: calender, user: user, all_day: false, start: day + rand(12.hours), end: day + 12.hours + rand(12.hours)
      )
    end

    5.times do
      day = rand(10).days.ago.beginning_of_day
      calender.events.create!(
        title: Faker::Lorem.sentence, calender: calender, user: user, all_day: true, start: day + rand(12.hours), end: day + 12.hours + rand(12.hours)

      )
    end

    5.times do
      day = rand(10).days.ago.beginning_of_day
      start = day + rand(1000.hours)
      e = start + rand(5.days)
      calender.events.create!(
        title: Faker::Lorem.sentence, calender: calender, user: user, all_day: true, start: start, end: e

      )
    end
  end
end
