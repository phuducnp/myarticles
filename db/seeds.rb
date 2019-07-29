begin
  Article.transaction do
    5.times do
      Article.create({
        title: Faker::Book.title,
        body: Faker::Lorem.sentence
      })
    end
  rescue => e
    raise ActiveRecord::Rollback
  end
end