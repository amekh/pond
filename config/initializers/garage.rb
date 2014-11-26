Garage.configure {}

Garage::TokenScope.configure do
  register :public, desc: 'acessing publicly available data' do
    access :read, MonthlyRecord
    access :write, MonthlyRecord
    access :read, DailyWork
    access :write, DailyWork
  end
end

Doorkeeper.configure do
  orm :active_record
  default_scopes :public
  optional_scopes(*Garage::TokenScope.optional_scopes)

  resource_owner_from_credentials do |routes|
    User.find_by(email: params[:username])
  end
end
