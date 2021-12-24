class AddCommentsCountToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :comments_count, :integer, default: 0, null: false

    # Post.find_each { |p| Post.reset_counters(p.id, :comments) }
    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE posts
           SET comments_count = (SELECT count(1)
                                   FROM comments
                                  WHERE comments.post_id = posts.id)
    SQL
  end

end
