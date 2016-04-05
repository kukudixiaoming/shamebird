module PostsHelper
  def post_music(id)
    href = "http://music.163.com/outchain/player?type=2&id=#{id}&auto=0&height=66"
    # html = "<iframe frameborder='no' border='0' marginwidth='0' marginheight='0' width=330 height=86 src=""#{href}""></iframe>"
    # raw html
    render html: "<iframe frameborder='no' border='0' marginwidth='0' marginheight='0' width=330 height=86 src=""#{href}""></iframe>".html_safe
  end
  # def post_link(id)
  #   render js: "
  #   $(document).on('page:change',function(){
  #   var $linkImgSrc = $(""#{id} .sub.header img"").attr("src");
  #   $(""#{id} .ui.circular.img"").attr("src",$linkImgSrc);
  #   });
  #   "
  # end
  def post_link(str)
    str = str.to_str
    length = str.length
    where = str =~ /!/
    str[where,length]
  end
end
