namespace :cable do

  desc "Generate quote every 2 seconds"
  task :many_quotes => :environment do

    puts "Will generate a quote every 2 seconds. Ctrl+C to quit"
    while true do
      generate_quote
      print "."
      sleep 2
    end
  end

  desc "Generate single quote"
  task :genquote => :environment do
    generate_quote
  end

  def generate_quote

    user = User.where(username: Faker::Internet.user_name).first_or_create({
      email: Faker::Internet.free_email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: Faker::Internet.password
    })
    quote = user.quotes.create body: [Faker::Company.name, Faker::Company.catch_phrase, Faker::Company.bs].join(" : ")

    ActionCable.server.broadcast "quote_notifications", quote.as_json 

  end
end
