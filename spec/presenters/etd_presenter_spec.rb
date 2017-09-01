# frozen_string_literal: true
require 'rails_helper'

describe EtdPresenter do
  subject { presenter }

  let(:title) { ['Journey to Skull Island'] }
  let(:creator) { ['Quest, Jane'] }
  let(:keyword) { ['Pirates', 'Adventure'] }
  let(:degree) { ['Master of Pirate Studies'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let :etd do
    Etd.new(
      title: title,
      creator: creator,
      keyword: keyword,
      degree: degree,
      visibility: visibility
    )
  end

  let(:ability) { Ability.new(user) }

  let(:presenter) do
    described_class.new(SolrDocument.new(etd.to_solr), nil)
  end

  # If the fields require no addition logic for display, you can simply delegate
  # them to the solr document
  it { is_expected.to delegate_method(:title).to(:solr_document) }
  it { is_expected.to delegate_method(:degree).to(:solr_document) }

  context "emoji replacement" do
    it "replaces the word skull with a skull emoji" do
      expect(presenter.emoji_title).to eq("Journey to 💀 Island")
    end
  end
end
