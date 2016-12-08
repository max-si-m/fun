feature 'Login to application' do
  let(:user)  { build(:user) } # imagine that we have factory girl :)

  before(:each) { visit login_path }

  scenario 'succefful login' do
    within '#sign_in' do
      fill_in 'name', with: user.name
      fill_in 'password', with: user.password
      click_on 'Login'
    end

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_xpath("//div[contains(@class, 'message-ok') and "\
                               "contains(., 'Welcome')]")
  end

  scenario 'invalide login' do
    within '#sign_in' { click_on 'Login' }

    expect(page).to have_xpath("//div[contains(@class, 'message-failure') and "\
                               "contains(., 'Login failed')]")
  end
end
