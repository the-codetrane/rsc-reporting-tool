set :stage, :production
set :branch, 'master'

role [:web, :db, :app], '35.163.29.223', user: 'ec2-user', primary: true