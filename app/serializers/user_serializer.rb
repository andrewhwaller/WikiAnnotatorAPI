class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :email
    has_many :articles
    cache_options enabled: true, cache_length: 12.hours
end