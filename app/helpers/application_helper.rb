# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  FLASH_NOTICE_KEYS = [:error, :notice, :warning]

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|
      content_tag :div, :id => 'flash', :class => type.to_s do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    formatted_messages.join
  end

  def message_for_item(message, item = nil)
    if item.is_a?(Array)
      message % link_to(*item)
    else
      message % item
    end
  end

  def select_academic_year(model, name, start_year, end_year)
    options = start_year > end_year ? [] :
      (start_year..end_year).map { |year| ["AY #{year}-#{year + 1}", year] }
    select model, name, options_for_select(options)
  end

  def facebook_badge(facebook)
    unless facebook.blank?
      link_to image_tag("facebook.png", :border => 0, :title => "Facebook"), "http://www.facebook.com/#{ 
        (/^[\d]*$/ =~ facebook).nil? ? 
        facebook :  "profile.php?id=#{facebook}" }"
    end
  end

  def twitter_badge(twitter)
    unless twitter.blank?
      link_to image_tag("twitter.png", :border => 0, :title => "Twitter"), "http://www.twitter.com/#{ twitter }"
    end
  end

  def multiply_badge(multiply)
    unless multiply.blank?
      link_to image_tag("multiply.png", :border => 0, :title => "Multiply"), "http://#{ multiply }.multiply.com/"
    end
  end

  def plurk_badge(plurk)
    unless plurk.blank?
      link_to image_tag("plurk.png", :border => 0, :title => "Plurk"), "http://www.plurk.com/#{ plurk }"
    end
  end

  def tumblr_badge(tumblr)
    unless tumblr.blank?
      link_to image_tag("tumblr.png", :border => 0, :title => "tumblr"), "http://#{ tumblr }.tumblr.com/"
    end
  end

  def livejournal_badge(livejournal)
    unless livejournal.blank?
      link_to image_tag("livejournal.png", :border => 0, :title => "LiveJournal"), "http://#{ livejournal }.livejournal.com/"      
    end
  end

  def linkedin_badge(linkedin)
    unless linkedin.blank?
      link_to image_tag("linkedin.png", :border => 0, :title => "LinkedIn"), linkedin
    end
  end


end
