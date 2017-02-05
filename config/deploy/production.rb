set :stage, :production
set :branch, 'master'

role [:web, :db, :app], '77.104.162.56', user: 'naworks4', primary: true, port: 18765