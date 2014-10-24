json.array!(@unit_missions) do |unit_mission|
  json.extract! unit_mission, :id, :mission_id, :user_id, :unit_cost, :start_date, :period, :limit_over_cost_lower, :limit_over_cost_higher
  json.url unit_mission_url(unit_mission, format: :json)
end
