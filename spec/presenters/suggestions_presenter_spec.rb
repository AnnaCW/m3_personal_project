require "rails_helper"

RSpec.describe SuggestionsPresenter, type: :presenter do

  it "returns false if applicable params are blank" do
    user = create(:user)

    params_decade = {"utf8"=>"✓", "genre"=>"", "commit"=>"GET!", "controller"=>"suggestions", "action"=>"index"}
    presenter_1 = SuggestionsPresenter.new(user, params_decade)

    params_genre = {"utf8"=>"✓", "decade"=>"", "commit"=>"GET!", "controller"=>"suggestions", "action"=>"index"}
    presenter_2 = SuggestionsPresenter.new(user, params_genre)

    expect(@suggestions_from_decade).to eq(nil)
    expect(@suggestions_from_genre).to eq(nil)
  end
end
