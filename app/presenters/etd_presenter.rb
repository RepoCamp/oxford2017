class EtdPresenter < Hyrax::WorkShowPresenter
  delegate :degree, to: :solr_document

  def emoji_title
    title.first.gsub('Skull', '💀')
  end
end
