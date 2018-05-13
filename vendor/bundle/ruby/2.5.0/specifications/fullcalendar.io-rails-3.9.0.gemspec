# -*- encoding: utf-8 -*-
# stub: fullcalendar.io-rails 3.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fullcalendar.io-rails".freeze
  s.version = "3.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Damian Ba\u0107kowski".freeze]
  s.date = "2018-03-05"
  s.description = "Asset pipeline bundling of the fullcalendar jquery plugin.".freeze
  s.email = ["damianbackowski@gmail.com".freeze]
  s.homepage = "https://github.com/dbackowski/fullcalendar.io-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "FullCalendar is a jQuery plugin that provides a full-sized, drag & drop event calendar like the one below. It uses AJAX to fetch events on-the-fly and is easily configured to use your own feed format. It is visually customizable with a rich API.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jquery-rails>.freeze, ["< 5.0", ">= 3.1.0"])
      s.add_runtime_dependency(%q<momentjs-rails>.freeze, ["~> 2.15"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rails>.freeze, ["~> 4.2.10"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<capybara>.freeze, ["~> 2.6"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
    else
      s.add_dependency(%q<jquery-rails>.freeze, ["< 5.0", ">= 3.1.0"])
      s.add_dependency(%q<momentjs-rails>.freeze, ["~> 2.15"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rails>.freeze, ["~> 4.2.10"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
      s.add_dependency(%q<capybara>.freeze, ["~> 2.6"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<jquery-rails>.freeze, ["< 5.0", ">= 3.1.0"])
    s.add_dependency(%q<momentjs-rails>.freeze, ["~> 2.15"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rails>.freeze, ["~> 4.2.10"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2.6"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
  end
end
