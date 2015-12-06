require 'rails_helper'

RSpec.describe 'municipalities/new', type: :view do
  before(:each) do
    assign(:municipality, Municipality.new(name: 'MyString', region: nil))
  end

  it 'renders new municipality form' do
    render

    assert_select 'form[action=?][method=?]', municipalities_path, 'post' do
      assert_select 'input#municipality_name[name=?]', 'municipality[name]'
      assert_select 'select#municipality_region_id[name=?]', 'municipality[region_id]'
    end
  end
end
