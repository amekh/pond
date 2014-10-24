# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit_mission do
    mission_id 1
    user_id 1
    unit_cost 1
    start_date "2014-10-24"
    period 1
    limit_over_cost_lower 1
    limit_over_cost_higher 1
  end
end
