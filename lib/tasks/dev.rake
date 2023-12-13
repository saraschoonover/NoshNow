require 'net/http'
require 'json'

unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:add_users",
      "sample_data"
    ]
 

    task add_users: :environment do
      puts "adding users..."
      names = ["rose", "hyacinth", "poppy"]
      names.each do |name|
        u = User.create(
          email: "#{name}@example.com",
          password: "password",
          image_url: "https://plus.unsplash.com/premium_photo-1689266188052-704d33673e69?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d29tYW58ZW58MHx8MHx8fDA%3D"
        )
      end 
    end

    task :sample_data => :environment do
      unless Rails.env.production?
        api_key = ENV["YELP_KEY"]

        User.all.each do |user|
          uri = URI('https://api.yelp.com/v3/businesses/search')
          params = {
            term: 'restaurant',
            location: 'Chicago',
            limit: 5,
            user_id: user.id
          }
          uri.query = URI.encode_www_form(params)

          request = Net::HTTP::Get.new(uri)
          request['Authorization'] = "Bearer #{api_key}"

          response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
            http.request(request)
          end

          if response.is_a?(Net::HTTPSuccess)
            number = 0
            5.times do
              business = JSON.parse(response.body)['businesses'][number]
              pp "business id #{ business['id']}"
              Favorite.create!(
                user: user,
                name: business['name'],
                categories: business['categories'].map { |category| category['title'] }.join(', '),
                display_phone: business['phone'],
                image_url: business['image_url'],
                location: business['location']['address1'],
                price: business['price'],
                rating: business['rating'],
                review_count: business['review_count'],
                transactions: business['transactions'].join(', '),
                yelp_id: business['id']
              )

              number = number + 1 
              pp "number updated to #{number}"
            end
            else
              puts "Error fetching data from Yelp API: #{response.code} - #{response.body}"
            end
        end

        puts "Sample data has been created."
      end
    end
  end
end
