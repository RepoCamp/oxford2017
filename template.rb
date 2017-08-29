gem 'hyrax', github: 'samvera/hyrax', ref: '181141da95e7f9efe5d5d7a1b8b38fed6c7c1ff9'
run 'bundle install'
generate 'hyrax:install', '-f'
rails_command 'db:migrate'
