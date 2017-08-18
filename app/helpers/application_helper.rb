module ApplicationHelper
  def user_avatar(user)
    if user.photo_url.present?
      user.photo_url
    elsif user.facebook_picture_url.present?
      user.facebook_picture_url
    else
      "https://www.1plusx.com/app/mu-plugins/all-in-one-seo-pack-pro/images/default-user-image.png"    end
  end
end
