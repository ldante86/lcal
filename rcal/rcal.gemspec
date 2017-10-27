lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'info'

Gem::Specification.new do |gem|
  gem.name		= Rcal_info::PROJECT_NAME
  gem.version		= Rcal_info::VERSION
  gem.date		= Rcal_info::YEAR
  gem.summary		= Rcal_info::SUMMARY
  gem.description	= Rcal_info::DESCRIPTION
  gem.authors		= Rcal_info::AUTHOR
  gem.email		= Rcal_info::EMAIL
  gem.license		= Rcal_info::LICENSE

  gem.rubyforge_project	= Rcal_info::PROJECT_NAME

  gem.files		= Dir.glob("{bin,lib,man,tests,scripts}/**/*") +
                          [ "README", "AUTHOR", 'make.sh' ]

  gem.executables	= 'rcal'
  gem.require_path	= 'lib'
end
