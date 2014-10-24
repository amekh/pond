# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mission do
    company_id 1
    mission_type 1
    title 1
    contents 1
    nes_work_time 1
    unnes_work_time_min 1
    unnes_work_time_max 1
  end
end
