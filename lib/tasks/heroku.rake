namespace :deploy do
  APP = 'padisignup'

  desc 'Push to heroku production, db:migrate, and restart app'
  task :production => [:push, :migrate, :restart]

  task :push do
    puts 'Deploying app to Heroku...'
    `git push heroku master`
  end

  task :restart do
    puts 'Restarting app servers ...'
    `heroku restart`
  end

  task :migrate do
    puts 'Running database migrations ...'
    `heroku run rake db:migrate`
  end
end
