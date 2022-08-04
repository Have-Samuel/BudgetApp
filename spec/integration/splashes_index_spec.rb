require 'rails_helper'

RSpec.describe 'Splashes', type: :system do
  describe 'index page' do
    before :each do
      User.create(name: 'Have-Samuel', email: 'samiehave9@gmail.com', password: 'anypassword')
    end
    it 'shoud go from splash screen to sign in page' do
      visit splash_path
      click_link 'LOGIN'
      expect(page).to have_text('Remember me')
    end

    it 'user should be able to login' do
      visit splash_path
      click_link 'LOGIN'
      find("input[placeholder='Name']").set 'Have-Samuel'
      find("input[placeholder='Email']").set 'samiehave9@gmail.com'
      find("input[placeholder='Password']").set 'anypassword'
      click_button('NEXT')
      expect(page).to have_text('Total amount')
    end

    it 'shoud go from splash screen to sign up page' do
      visit splash_path
      click_link 'SIGNUP'
      expect(page).to have_text('REGISTER')
    end
  end
end
