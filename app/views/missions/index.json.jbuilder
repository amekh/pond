json.array!(@missions) do |mission|
  json.extract! mission, :id, :company_id, :mission_type, :title, :contents, :nes_work_time, :unnes_work_time_min, :unnes_work_time_max
  json.url mission_url(mission, format: :json)
end
