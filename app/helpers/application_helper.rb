# coding: utf-8
module ApplicationHelper

  #
  # Gravatarに登録してある画像URLに変換
  #
  # @param [String] email_address emailアドレス
  # @return [String] Gravatarの画像URL
  #
  def avatar_url( email_address )
    default_url = "#{root_url}assets/default.png"
    gravatar_id = Digest::MD5.hexdigest(email_address.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=40&d=#{CGI.escape(default_url)}"
  end
  
end
