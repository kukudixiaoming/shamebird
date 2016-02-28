module PostsHelper
  def post_music(id)
    href = "http://music.163.com/outchain/player?type=2&id=#{id}&auto=0&height=66"
    html = "<iframe frameborder='no' border='0' marginwidth='0' marginheight='0' width=330 height=86 src=""#{href}""></iframe>"
    raw html
  end
end
