require 'rails_helper'

RSpec.describe 'welcome/index.html.erb', type: :view do
  before do
    render
  end

  it 'has a link to countries' do
    assert_select 'a', href: countries_path, text: 'Countries'
  end

  it 'has a link to interviews' do
    assert_select 'a', href: interviews_path, text: 'Interviews'
  end

  it 'has a link to interviewees' do
    assert_select 'a', href: interviewees_path, text: 'Interviewees'
  end

  it 'has a link to interviewers' do
    assert_select 'a', href: interviewers_path, text: 'Interviewers'
  end

  it 'has a link to languages' do
    assert_select 'a', href: languages_path, text: 'Languages'
  end

  it 'has a link to locales' do
    assert_select 'a', href: locales_path, text: 'Locales'
  end

  it 'has a link to municipalities' do
    assert_select 'a', href: municipalities_path, text: 'Municipalities'
  end

  it 'has a link to phrases' do
    assert_select 'a', href: phrases_path, text: 'Phrases'
  end

  it 'has a link to recordings' do
    assert_select 'a', href: recordings_path, text: 'Recordings'
  end

  it 'has a link to regions' do
    assert_select 'a', href: regions_path, text: 'Regions'
  end

  it 'has a link to studies' do
    assert_select 'a', href: studies_path, text: 'Studies'
  end
end
