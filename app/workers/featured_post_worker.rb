class FeaturedPostWorker
  include Sidekiq::Worker
  def perform
    remove_featured_posts
    make_featured_post
  end

  def remove_featured_posts
    post = Post.where(featured: true).first
    if post
      post.featured = false
      post.save!
    end
  end

  def make_featured_post
    post = Post.offset(rand(Post.count)).first
    post.featured = true
    post.save!
  end
end
