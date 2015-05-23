namespace :dev do
  task fake: %i[db:reset environment] do
    titles = %w[吃飯 睡覺 打東東 做瑜伽 寫程式 上班 吃火鍋 與朋友晚餐 國小同學會 社團博覽會 迎新
      送舊學長姐 社團聚餐 系上家聚 叫到社課]
    user = User.create! email: 'hello@test.com', password: 'password'
    user_2 = User.create! email: 'hello2@test.com', password: 'password'
    calender = user.calenders.create! name: '奧萬大行事曆', public: true
    5.times do
      day = rand(10).days.ago.beginning_of_day
      calender.events.create!(
        title: titles.sample, calender: calender, user: user, all_day: false, start: day + rand(12.hours), end: day + 12.hours + rand(12.hours)
      )
    end

    5.times do
      day = rand(10).days.ago.beginning_of_day
      calender.events.create!(
        title: titles.sample, calender: calender, user: user, all_day: true, start: day + rand(12.hours), end: day + 12.hours + rand(12.hours)
      )
    end

    5.times do
      day = rand(10).days.ago.beginning_of_day
      start = day + rand(1000.hours)
      e = start + rand(5.days)
      calender.events.create!(
        title: titles.sample, calender: calender, user: user, all_day: true, start: start, end: e
      )
    end
  end
end
