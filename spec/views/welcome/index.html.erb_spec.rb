require 'rails_helper'

RSpec.describe 'welcome/index.html.erb', type: :view do
  before do
    render
  end

  context 'has links to' do
    it 'countries' do
      assert_select 'a', href: countries_path, text: 'Countries'
    end

    it 'interviews' do
      assert_select 'a', href: interviews_path, text: 'Interviews'
    end

    it 'interviewees' do
      assert_select 'a', href: interviewees_path, text: 'Interviewees'
    end

    it 'interviewers' do
      assert_select 'a', href: interviewers_path, text: 'Interviewers'
    end

    it 'languages' do
      assert_select 'a', href: languages_path, text: 'Languages'
    end

    it 'locales' do
      assert_select 'a', href: locales_path, text: 'Locales'
    end

    it 'municipalities' do
      assert_select 'a', href: municipalities_path, text: 'Municipalities'
    end

    it 'phrases' do
      assert_select 'a', href: phrases_path, text: 'Phrases'
    end

    it 'recordings' do
      assert_select 'a', href: recordings_path, text: 'Recordings'
    end

    it 'regions' do
      assert_select 'a', href: regions_path, text: 'Regions'
    end

    it 'studies' do
      assert_select 'a', href: studies_path, text: 'Studies'
    end
  end
end
