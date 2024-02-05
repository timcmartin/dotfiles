namespace :git do
  desc 'Git tasks'

  task :checkout_new, [:commit_message] =>
  [:lock, :add, :commit, :new_checkout] do
    puts "new branch #{ENV['NEW_BRANCH']} created!"
  end

  task :lock do
    sh "git co Gemfile.lock"
  end

  task :add do
    sh "git add ."
  end

  task :commit, [:commit_message] do |t, args|
    sh "git commit -m '#{args[:commit_message]}'"
  end

  task :new_checkout do
    sh "git checkout -b #{ENV['NEW_BRANCH']}"
  end

  task :commit_all, [:commit_message] => [:lock, :add, :commit] do |t, args|
    sh "say '#{args[:commit_message]} committed'"
  end
end
