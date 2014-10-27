# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :daily_work do
    association :unit_mission
    user_id 2
    unit_mission_id 2
    target_date "2014-10-26"
    start_time "10:00:00"
    end_time "19:00:00"
    rest_time 1.5
    status 2
    contents "MyText"
    memo "MyText"
  end
end
