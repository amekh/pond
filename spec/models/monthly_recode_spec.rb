require 'rails_helper'

RSpec.describe MonthlyRecode, :type => :model do
  before(:each) do
    @monthly_recode = FactoryGirl.create( :monthly_recode,
                                          salary:200000, welfare:3000, carfare:10000 );
  end

  it 'get_miscellany_salary' do
    expect( @monthly_recode.get_miscellany_salary ).to eq( 33495 )
  end

  it 'get_calc_basis_amount' do
    expect( @monthly_recode.get_calc_basis_amount ).to eq( 1013 )
  end

  it 'get_unit_outlay' do
    expect( @monthly_recode.get_unit_outlay ).to eq( 125860 )
  end
  
end
