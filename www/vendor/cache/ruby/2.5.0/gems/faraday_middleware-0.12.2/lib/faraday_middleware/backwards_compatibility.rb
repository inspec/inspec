# deprecated constants

Faraday::Request.class_eval do
  autoload :OAuth,        'faraday_middleware/request/oauth'
  autoload :OAuth2,       'faraday_middleware/request/oauth2'
end

Faraday::Response.class_eval do
  autoload :Mashify,      'faraday_middleware/response/mashify'
  autoload :Rashify,      'faraday_middleware/response/rashify'
  autoload :ParseJson,    'faraday_middleware/response/parse_json'
  autoload :ParseXml,     'faraday_middleware/response/parse_xml'
  autoload :ParseMarshal, 'faraday_middleware/response/parse_marshal'
  autoload :ParseYaml,    'faraday_middleware/response/parse_yaml'
end
