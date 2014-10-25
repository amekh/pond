# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :daily_work do
    user_id 1
    unit_mission 1
    start_time "2014-10-26"
    end_time "2014-10-26"
    type 1
    contents "MyText"
    memo "MyText"
  end
end
