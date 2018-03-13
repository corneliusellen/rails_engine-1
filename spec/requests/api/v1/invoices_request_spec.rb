require "rails_helper"

describe "Invoice Request" do
  it "can show you all of the invoices" do
    create_list(:invoice, 10)

    get "/api/v1/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(10)
    expect(invoices[0]["status"]).to eq("It's Complicated")
  end

  it "can show you one invoice" do
    create_list(:invoice, 10)

    get "/api/v1/invoices/5"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["status"]).to eq("It's Complicated")
  end

  it "can search by status and return one" do
    create_list(:invoice, 5, status: "Argwillinillifus Grotcherinkleton")
    create_list(:invoice, 5)

    get "/api/v1/invoices/find?status=Argwillinillifus-Grotcherinkleton"

    invoice = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(invoice["status"]).to eq("Argwillinillifus Grotcherinkleton")
  end

  it "can search by status and return all" do
    create_list(:invoice, 5, status: "Argwillinillifus Grotcherinkleton")
    create_list(:invoice, 5)

    get "/api/v1/invoices/find_all?status=Argwillinillifus-Grotcherinkleton"

    invoices = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(invoices.count).to eq(5)
    expect(invoices[2]["status"]).to eq("Argwillinillifus Grotcherinkleton")
  end

  it "can return a random invoice for some reason" do
    create_list(:invoice, 5, status: "Argwillinillifus Grotcherinkleton")
    create_list(:invoice, 5)

    get "/api/v1/invoices/random"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.class).to eq(Hash)
  end
end
