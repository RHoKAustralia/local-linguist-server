require 'rails_helper'

RSpec.describe 'interviewees/new', type: :view do
  before(:each) do
    assign(:interviewee, Interviewee.new(
      :name => 'MyString',
      :mobile => 'MyString',
      :email => 'MyString',
      :gender => 'MyString',
      :occupation => 'MyString',
      :education_level => 'MyString'
    ))
  end

  it 'renders new interviewee form' do
    render

    assert_select 'form[action=?][method=?]', interviewees_path, 'post' do

      assert_select 'input#interviewee_name[name=?]', 'interviewee[name]'

      assert_select 'input#interviewee_mobile[name=?]', 'interviewee[mobile]'

      assert_select 'input#interviewee_email[name=?]', 'interviewee[email]'

      assert_select 'select#interviewee_gender[name=?]', 'interviewee[gender]'

      assert_select 'select#interviewee_occupation[name=?]', 'interviewee[occupation]'

      assert_select 'select#interviewee_education_level[name=?]', 'interviewee[education_level]'

      assert_select 'input#interviewee_age[name=?]', 'interviewee[age]'
    end
  end
end
