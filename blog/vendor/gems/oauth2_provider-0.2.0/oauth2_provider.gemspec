# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{oauth2_provider}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ThoughtWorks, Inc."]
  s.date = %q{2010-08-31}
  s.description = %q{A Rails plugin to OAuth v2.0 enable your rails application. This plugin implements v09 of the OAuth2 draft spec http://tools.ietf.org/html/draft-ietf-oauth-v2-09.}
  s.email = %q{ketan@thoughtworks.com}
  s.extra_rdoc_files = ["README.textile", "MIT-LICENSE.txt"]
  s.files = ["app/controllers/oauth2/provider/oauth_authorize_controller.rb", "app/controllers/oauth2/provider/oauth_clients_controller.rb", "app/controllers/oauth2/provider/oauth_token_controller.rb", "app/controllers/oauth2/provider/oauth_user_tokens_controller.rb", "app/models/oauth2/provider/oauth_authorization.rb", "app/models/oauth2/provider/oauth_client.rb", "app/models/oauth2/provider/oauth_token.rb", "app/views/oauth2/provider/layouts/oauth_clients.html.erb", "app/views/oauth2/provider/oauth_authorize/index.html.erb", "app/views/oauth2/provider/oauth_clients/edit.html.erb", "app/views/oauth2/provider/oauth_clients/index.html.erb", "app/views/oauth2/provider/oauth_clients/new.html.erb", "app/views/oauth2/provider/oauth_clients/show.html.erb", "app/views/oauth2/provider/oauth_user_tokens/index.html.erb", "config/routes.rb", "generators/oauth2_provider/oauth2_provider_generator.rb", "generators/oauth2_provider/templates/config/initializers/oauth2_provider.rb", "generators/oauth2_provider/templates/db/migrate/create_oauth_authorizations.rb", "generators/oauth2_provider/templates/db/migrate/create_oauth_clients.rb", "generators/oauth2_provider/templates/db/migrate/create_oauth_tokens.rb", "init.rb", "lib/oauth2/provider/a_r_datasource.rb", "lib/oauth2/provider/application_controller_methods.rb", "lib/oauth2/provider/clock.rb", "lib/oauth2/provider/in_memory_datasource.rb", "lib/oauth2/provider/model_base.rb", "lib/oauth2_provider.rb", "MIT-LICENSE.txt", "oauth2_provider.gemspec", "README.textile", "tasks/gem.rake", "CHANGELOG"]
  s.homepage = %q{http://github.com/ThoughtWorksStudios/oauth2_provider}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Rails plugin to OAuth v2.0 enable your rails application}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
