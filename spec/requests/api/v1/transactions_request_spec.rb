# require "rails_helper"
#
# describe "Transcations API" do
#   it "sends a list of transactions" do
#     create_list(:transactions, 3)
#
#     get "/api/v1/transactions"
#
#     expect(response).to be_success
#     binding.pry
#     transctions = JSON.parse(response.body)
#     expect(transactions.count).to eq(3)
#   end
#
#
#
#   it "can get one transaction by its id" do
#     id = create(:transaction).id
#
#     get "/api/v1/transactions/#{id}"
#
#     transaction = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(transaction["id"]).to eq(id)
#   end
# end