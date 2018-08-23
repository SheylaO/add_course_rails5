require 'rails_helper'

RSpec.feature "Adding reviews to Articles"  do
	
	before do
		@john = User.create(email: "John@example.com", password: "password")
		@shey = User.create(email: "shey@example.com", password: "password")
		@article = Article.create!(title: "Title One", body: "Body of article one", user: @john)
	end

	scenario "permits a signed in user to write a review" do
		login_as(@shey)

		visit "/"

		click_link @article.title
		fill_in "New Comment", with: "An amazing article"
		click_button "Add Comment"

		expect(page).to have_content("Comment has been created")
		expect(page).to have_content("An amazing article")
		expect(current_path).to eq(article_path(@article.id))

	end

end