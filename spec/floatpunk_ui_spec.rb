require "rails_helper"

RSpec.describe FloatpunkUi do
  it "has a version" do
    expect(FloatpunkUi::VERSION).to match(/\A\d+\.\d+\.\d+\z/)
  end

  it "knows the three sister sites" do
    expect(FloatpunkUi::SITES.keys).to eq(%i[floatpunk hangman word_chain])
  end
end
