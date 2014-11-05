json.array!(@monthly_recodes) do |monthly_recode|
  json.extract! monthly_recode, :id, :user_id, :samary, :welfare, :carfare
  json.url monthly_recode_url(monthly_recode, format: :json)
end
