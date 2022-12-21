require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    it 'has an index page' do
        visit users_url
        save_and_open_page
        expect(page).to have_content('Index')
      end

end
