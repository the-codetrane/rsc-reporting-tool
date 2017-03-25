set :stage, :production
set :branch, 'master'

role [:web, :db, :app], '138.197.43.52', user: 'root', primary: true