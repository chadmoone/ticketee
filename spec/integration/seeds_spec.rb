require "spec_helper"

feature "Seed data" do
  scenario "The basics" do
    load Rails.root + "db/seeds.rb"
    user = User.find_by_email!("admin@ticketee.com")
    sign_in_as!(user)
    page.should have_content("Ticketee Beta")
  end
end