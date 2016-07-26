require "rails_helper"

RSpec.describe Category, type: :model do

  def user
    create(:user)
  end

  context "#categories" do
    it "finds all categories" do
      VCR.use_cassette("categories") do
        categories = Category.all(user)

        expect(categories.count).to eq(20)
        expect(categories.first.name).to eq("Top Lists")
      end
    end
  end

  context "#categories" do
    it "returns popular categories" do
      VCR.use_cassette("categories") do
        categories = Category.popular(user)

        expect(categories.first.name).to eq("Top Lists")
      end
    end
  end

  context "#category" do
    it "finds a category by id" do
      VCR.use_cassette("category") do
        category_id = "toplists"
        result = Category.find(user, category_id)

        expect(result["name"]).to eq("Top Lists")
      end
    end
  end

  context "#category" do
    it "finds playlists for category" do
      VCR.use_cassette("category_playlists") do
        category_id = "focus"
        result = Category.playlists(user, category_id)

        expect(result["playlists"]["items"].first["name"]).to eq("Peaceful Piano")
      end
    end
  end
end
