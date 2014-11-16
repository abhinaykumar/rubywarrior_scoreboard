require 'spec_helper'

describe "Scoreboard" do
  let!(:score)  { FactoryGirl.create(:score) }

  it "Should display a warrior and scores on the homepage" do
    visit root_path
    page.should_not have_content('Level 2')
    page.should have_link(score.combined_score)
  end

  it "Should display full details for a particular score" do
    visit score_path(score)
    page.should have_content("Score for #{score.warrior.name} for level #{ score.level_number }")
  end

  it "Should display the source code" do
    visit score_path(score)
    page.should have_content(score.source_code)
  end

  it "Should display the flog score" do
    visit score_path(score)
    page.should have_content("Player#play_turn")
    page.should have_content("Total score")
  end
end