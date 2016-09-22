module ApplicationHelper
  def title()
    action_name
    case params[:action]
      when "new"
        action_name = "新建"
      when "create"
        action_name = "创建"
      when "edit"
        action_name = "编辑"
      when "update"
        action_name = "更新"
    end
    if (params[:controller] != "admin/settings")&&(params[:controller] != "comments")
      if @category.category_name == nil
        category_name = "分类"
      else
        category_name = @category.category_name
      end

=begin
    if params[:controller] == "posts"&&params[:action] == "show";
      "#{@post.post_title}-#{@category.category_name}-#{Setting.Site_Header}"
    elsif params[:controller] == "posts"
      "#{action_name}-#{@post.post_title}-#{@category.category_name}-#{Setting.Site_Header}"
    else
      "#{@category.category_name}-#{Setting.Site_Header}"
    end
=end

      if (params[:controller] == "categories"&&params[:action] == "show")||(params[:controller] != "categories"&&params[:controller] != "posts"&&params[:action] == "show")
        "#{@category.category_name}-#{Setting.Site_Header}"
      elsif (params[:controller] == "categories"&&params[:action] != "show")||(params[:controller] != "categories"&&params[:controller] != "posts"&&params[:action] != "show")
        "#{action_name}·#{category_name}-#{Setting.Site_Header}"
      elsif params[:controller] == "posts"&&params[:action] == "show"
        "#{@post.post_title}-#{@category.category_name}-#{Setting.Site_Header}"
        # elsif params[:controller] == "posts"&&params[:action] != "show"
      else
        "#{action_name}·#{@post.post_title}-#{@category.category_name}-#{Setting.Site_Header}"
      end
    elsif params[:controller] == "admin/settings"
      "setting-#{Setting.Site_Header}"
    else
      "评论"
    end
  end
end
