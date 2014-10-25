json.array!(@daily_works) do |daily_work|
  json.extract! daily_work, :id, :user_id, :unit_mission, :start_time, :end_time, :type, :contents, :memo
  json.url daily_work_url(daily_work, format: :json)
end
