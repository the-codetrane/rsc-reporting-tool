set :stage, :production
set :branch, 'master'

role [:web, :db, :app], '138.197.69.82', user: 'cain-admin', primary: true