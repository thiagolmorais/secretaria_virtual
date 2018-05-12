# -*- encoding: utf-8 -*-
# stub: jquery-qtip2-wrapper-rails 3.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery-qtip2-wrapper-rails".freeze
  s.version = "3.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Christian Dobert".freeze]
  s.date = "2016-08-05"
  s.description = "A simple asset wrapper for the qTip2 jQuery plugin. See http://qtip2.com".freeze
  s.email = ["chr.dobert@gmail.com".freeze]
  s.homepage = "https://github.com/dondope/jquery-qtip2-wrapper-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "A simple asset wrapper for the qTip2 jQuery plugin.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
