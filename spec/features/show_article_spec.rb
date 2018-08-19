require "rails_helper"

RSpec.feature "Showing an article" do

	before do
		@john = User.create(email: "john@example.com", password: "password")
		@shey = User.create(email: "shey@example.com", password: "password")
		@article = Article.create(title: "The first article", body: "Lorem ipsum.", user: @john)
	end


	scenario "to non-signed in user hide the Edit and Delete buttons" do
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))

		expect(page).not_to have_link("Edit Article")
		expect(page).not_to have_link("Delete Article")
	end

	scenario "to non-owner hide the Edit and Delete buttons" do
		login_as(@shey)
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))

		expect(page).not_to have_link("Edit Article")
		expect(page).not_to have_link("Delete Article")
	end
end