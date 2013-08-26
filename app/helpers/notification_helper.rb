module NotificationHelper

  def possessive_to_s(notification)
    notification.subject == current_user ? "Your" : "#{html_escape(notification.subject.name.capitalize)}'s"
  end

  def subject_to_s(notification)
    notification.subject == current_user ? "You have" : "#{html_escape(notification.subject.name.capitalize)} has"
  end

  def thumbnail(photo)
    if photo
      <<-HTML
      <a href="#{cell_path(photo.cell)}">
        #{image_tag photo.img.url(:thumbnail)}
      </a>
      HTML
    else
      ""
    end
  end

  def to_html(notification)
    show_url = cell_url(notification.photo.cell) if notification.photo
    possessive = possessive_to_s(notification)
    subject = subject_to_s(notification)
    thumbnail = thumbnail(notification.photo)

    case notification.quality
    when "quit"
      notice = "#{notification.subject.name.capitalize} has quit the game."
    when "new"
      notice = pending_photo_notice(notification, show_url)
    when "accept"
      notice = link_to "#{possessive} photo has been accepted.", show_url
    when "reject"
      notice = link_to "#{possessive} photo has been rejected.", show_url
    when "win"
      notice = "#{subject} won the game!"
    end
    <<-HTML
      <ul class="group">
        <li>#{thumbnail}</li>
        <li><notice>#{notice}</notice></li>
        <li><time>#{notification.updated_at}</time></li>
      </ul>
HTML
  end

  def pending_photo_notice(notification, show_url)
    if notification.photo
      my_votes = notification.photo.votes.where("user_id = ?", current_user.id)
    end

    if current_user == notification.subject
      link_to "Your photo has been submitted for approval.", show_url
    elsif my_votes.blank?
      link_to "You have a pending photo to vote on.", show_url, class: "pending"
    elsif my_votes.first.approve
      link_to "You approved a photo.", show_url
    else
      link_to "You rejected a photo.", show_url
    end
  end

end
