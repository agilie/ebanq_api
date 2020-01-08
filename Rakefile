# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rdoc/rdoc'
task default: :spec

RDoc::Task.new :rdoc do |rdoc|
  rdoc.main = 'README.rdoc'
  rdoc.rdoc_dir = 'docs'
  rdoc.rdoc_files.include('README.md', 'lib/ebanq_api/**/*.rb')

  rdoc.title = 'Ebanq'
  rdoc.options << '--all'
end
