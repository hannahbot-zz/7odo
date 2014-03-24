every :day, :at => '12:00am' do
  rake delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end
