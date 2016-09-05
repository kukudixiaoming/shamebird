module CategoriesHelper
  def copy_year(start_year = '2016')
    now_year = Time.new.strftime("%Y")
    if now_year == start_year
      "©#{now_year}"
    else
      "©#{start_year} - #{now_year}"
    end
  end


  # def which_posts_template(category_id=1)
  #   case category_id
  #   # when 1,3
  #   #   render partial: "posts/post1", collection: @category.posts.reverse
  #   when 4
  #     render 'posts/post4'
  #   when 5
  #     render 'posts/post5'
  #   when 8
  #     render 'posts/post8'
  #   else
  #     "泥壕，我的 category_id 是 #{category_id}"
  #     render partial: "posts/post1", collection: @category.posts.reverse
  #     # "泥壕，我的 category_id 是 #{category_id}"

# def category_which_path(category, category_type)
#   case category_type
#   when "post"
#     category_posts_path(category)
#   when "microblog"
#     category_microblogs_path(category)
#   when "album"
#     category_albums_path(category)
#   else
#     ##跳出处理
#   end
# end

  def which_category_template(category_type)
    case category_type
    # when 1,3
    #   render partial: "posts/post1", collection: @category.posts.reverse
    when "post"
      render 'posts/posts'
    when "microblog"
      render 'microblogs/microblogs'
    when "album"
      render 'albums/albums'
    else
      render html: "<strong>Not Found</strong>".html_safe
    # # else
    # #   "泥壕，我的 category_type 是 #{category_type}"
    # #   render partial: "posts/post1", collection: @category.posts.reverse
    # #   # "泥壕，我的 category_id 是 #{category_id}"
    end
  end

  def cutpost(str, path)
    long = str =~ /moremore/
    omi = "... #{link_to "继续阅读", path}"
    if long == nil
      long = str.length
    end
    str.truncate(long+omi.length, omission: "... #{link_to "继续阅读", path}")
    # 此处有一个bug '... <a href="/categories/1/posts/18">continued</a>' 的长度为50
    # 如果18部分是一位数或者三位数呢
    # 此bug已解决 通过定义 omi 字符串变量
  end
end
