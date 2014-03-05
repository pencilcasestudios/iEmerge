require "spec_helper"

describe "Assets" do
  # In app/assets/stylesheets/
  describe "app/assets/stylesheets/" do
    it "has stylesheet assets" do
      get "/assets/styles.css"
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end




  # In app/assets/
  describe "app/assets/fonts/" do
    it "has font assets" do
      # Test that fonts are present
    end
  end




  # In app/assets/images/
  describe "app/assets/images/" do
    it "has image assets" do
      # Favicons
      get "/assets/apple-touch-icon.png"
      expect(response).to be_success
      expect(response.status).to eq(200)

      get "/assets/apple-touch-icon-72x72.png"
      expect(response).to be_success
      expect(response.status).to eq(200)

      get "/assets/apple-touch-icon-114x114.png"
      expect(response).to be_success
      expect(response.status).to eq(200)

      get "/assets/favicon.ico"
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end




  # In app/assets/images/logos/
  describe "app/assets/images/logos/" do
    it "has image assets" do
      # Logos
      get "/assets/logos/iemerge_agency_logo_black-3000x3000.png"
      expect(response).to be_success
      expect(response.status).to eq(200)

      get "/assets/logos/iemerge_agency_logo_black-400x400.png"
      expect(response).to be_success
      expect(response.status).to eq(200)

      get "/assets/logos/iemerge_agency_logo_white-3000x3000.png"
      expect(response).to be_success
      expect(response.status).to eq(200)

      get "/assets/logos/iemerge_agency_logo_white-400x400.png"
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end




  # ZURB Foundation assets
  describe "Foundation assets" do
    it "are available" do
      # Test that assets are present
    end
  end
end
