class ArticleSerializer
    include FastJsonapi::ObjectSerializer
    attributes :title, :extract, :pageid, :created_at, :updated_at, :id
    belongs_to :user
    cache_options enabled: false, cache_length: 12.hours
  end
  