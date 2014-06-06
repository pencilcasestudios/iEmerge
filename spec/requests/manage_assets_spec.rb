require "rails_helper"









describe "Image assets" do
	it "are available" do
		# Backgrounds
		expect(File.exist?("app/assets/images/backgrounds/background1-1024x680.jpg")).to be true
		expect(File.exist?("app/assets/images/backgrounds/background2-1024x680.jpg")).to be true
		expect(File.exist?("app/assets/images/backgrounds/background3-1024x680.jpg")).to be true

		# Favicons
		expect(File.exist?("app/assets/images/apple-touch-icon.png")).to be true
		expect(File.exist?("app/assets/images/apple-touch-icon-72x72.png")).to be true
		expect(File.exist?("app/assets/images/apple-touch-icon-114x114.png")).to be true
		expect(File.exist?("app/assets/images/favicon.ico")).to be true

		# Logos
		expect(File.exist?("app/assets/images/logos/iemerge_agency_logo_black-3000x3000.png")).to be true
		expect(File.exist?("app/assets/images/logos/iemerge_agency_logo_black-400x400.png")).to be true
		expect(File.exist?("app/assets/images/logos/iemerge_agency_logo_white-3000x3000.png")).to be true
		expect(File.exist?("app/assets/images/logos/iemerge_agency_logo_white-400x400.png")).to be true

		# Portfolio
		expect(File.exist?("app/assets/images/portfolio/cavendish_university.jpg")).to be true
		expect(File.exist?("app/assets/images/portfolio/iemerge_profile_cover.png")).to be true
		expect(File.exist?("app/assets/images/portfolio/manda_hill_day_of_fashion.jpg")).to be true
		expect(File.exist?("app/assets/images/portfolio/manda_hill_night_of_fashion.jpg")).to be true
		expect(File.exist?("app/assets/images/portfolio/miss_university_africa.jpg")).to be true
		expect(File.exist?("app/assets/images/portfolio/sparkle_on_ice.jpg")).to be true
		expect(File.exist?("app/assets/images/portfolio/yatatu_launch.jpg")).to be true
		expect(File.exist?("app/assets/images/portfolio/zamtel_ericsson.jpg")).to be true

		# Talent
		expect(File.exist?("app/assets/images/talent/talent1.jpg")).to be true
		expect(File.exist?("app/assets/images/talent/talent2.jpg")).to be true
		expect(File.exist?("app/assets/images/talent/talent3.jpg")).to be true
		expect(File.exist?("app/assets/images/talent/talent4.jpg")).to be true
		expect(File.exist?("app/assets/images/talent/talent5.jpg")).to be true
		expect(File.exist?("app/assets/images/talent/talent6.jpg")).to be true
		expect(File.exist?("app/assets/images/talent/talent7.jpg")).to be true
		expect(File.exist?("app/assets/images/talent/talent8.jpg")).to be true
		expect(File.exist?("app/assets/images/talent/talent9.jpg")).to be true
	end
end









describe "PDF assets" do
	it "are available" do
		# PDFs
		expect(File.exist?("app/assets/pdfs/iemerge_profile.pdf")).to be true
	end
end
