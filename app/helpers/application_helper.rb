# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to(repo, "https://github.com/#{author}/#{repo}")
  end

  def flash_messages(flash)
    flash.map do |key, msg|
      tag.div(msg, id: key, class: 'flash alert')
    end.join.html_safe
  end
end
