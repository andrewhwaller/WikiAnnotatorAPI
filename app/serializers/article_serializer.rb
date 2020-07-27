class ArticleSerializer
    include FastJsonapi::ObjectSerializer
    attributes :title, :extract, :pageid, :created_at, :updated_at
    belongs_to :user
    cache_options enabled: true, cache_length: 12.hours
  end
  