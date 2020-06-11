require 'faraday'

module FaradayMiddleware
  autoload :OAuth,           'faraday_middleware/request/oauth'
  autoload :OAuth2,          'faraday_middleware/request/oauth2'
  autoload :EncodeJson,      'faraday_middleware/request/encode_json'
  autoload :MethodOverride,  'faraday_middleware/request/method_override'
  autoload :Mashify,         'faraday_middleware/response/mashify'
  autoload :Rashify,         'faraday_middleware/response/rashify'
  autoload :ParseJson,       'faraday_middleware/response/parse_json'
  autoload :ParseXml,        'faraday_middleware/response/parse_xml'
  autoload :ParseMarshal,    'faraday_middleware/response/parse_marshal'
  autoload :ParseYaml,       'faraday_middleware/response/parse_yaml'
  autoload :ParseDates,      'faraday_middleware/response/parse_dates'
  autoload :Caching,         'faraday_middleware/response/caching'
  autoload :Chunked,         'faraday_middleware/response/chunked'
  autoload :RackCompatible,  'faraday_middleware/rack_compatible'
  autoload :FollowRedirects, 'faraday_middleware/response/follow_redirects'
  autoload :Instrumentation, 'faraday_middleware/instrumentation'
  autoload :Gzip, 'faraday_middleware/gzip'

  if Faraday::Middleware.respond_to? :register_middleware
    Faraday::Request.register_middleware \
      :oauth    => lambda { OAuth },
      :oauth2   => lambda { OAuth2 },
      :json     => lambda { EncodeJson },
      :method_override => lambda { MethodOverride }

    Faraday::Response.register_middleware \
      :mashify  => lambda { Mashify },
      :rashify  => lambda { Rashify },
      :json     => lambda { ParseJson },
      :json_fix => lambda { ParseJson::MimeTypeFix },
      :xml      => lambda { ParseXml },
      :marshal  => lambda { ParseMarshal },
      :yaml     => lambda { ParseYaml },
      :dates    => lambda { ParseDates },
      :caching  => lambda { Caching },
      :follow_redirects => lambda { FollowRedirects },
      :chunked => lambda { Chunked }

    Faraday::Middleware.register_middleware \
      :instrumentation  => lambda { Instrumentation },
      :gzip => lambda { Gzip }
  end
end

require 'faraday_middleware/backwards_compatibility'
