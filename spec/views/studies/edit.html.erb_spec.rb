require 'rails_helper'

RSpec.describe 'studies/edit', type: :view do
  before(:each) do
    @study = assign(:study, Study.create!(
      name: 'My Study',
      start_date: '2017-07-01'
    ))
  end

  it 'renders the edit study form' do
    render

    assert_select 'form[action=?][method=?]', study_path(@study), 'post' do

      assert_select 'input#study_name[name=?]', 'study[name]'

      assert_select 'select#study_start_date_1i[name=?]', 'study[start_date(1i)]'
      assert_select 'select#study_start_date_2i[name=?]', 'study[start_date(2i)]'
      assert_select 'select#study_start_date_3i[name=?]', 'study[start_date(3i)]'
    end
  end
end
