RSpec.describe "Users", type: :request do
    describe "GET /users" do
        it "works!" do
            get new_user_url
            expect(response).to have_http_status(200)
            expect(response.body).to include("Index")
        end
    end
end