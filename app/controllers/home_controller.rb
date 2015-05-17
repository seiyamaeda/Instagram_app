class HomeController < ApplicationController

  # http://www.rubydoc.info/github/Instagram/instagram-ruby-gem/Instagram/Client/Tags
  # http://www.stefanosioannou.com/rails-4-simple-search-form/
  # http://railsdoc.com/references/form_tag

  # 人気の写真を10枚表示させておく
  def index
    @medias = Instagram.media_popular({:count => 3})
    
    # Tag検索
    if params[:search]
      # 空文字判定 :empty?ではなくnil?ではエラーが出た
      unless params[:search].empty?
        @searched_medias = Instagram.tag_recent_media(URI.encode(params[:search]), {:count => 10})
      end
    end

  end

  # 検索結果 :パラメタチェックを入れる
  #private
    #def home_params
      #params[:home].permit(:searched_text)
    #end
    #def searchByTagItem
      #return Instagram.tag_recent_media(URI.encode("starwars", "photo"), {:count => 10})
    #end
end
