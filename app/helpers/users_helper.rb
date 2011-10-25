module UsersHelper

  def gravatar_for(user, options = { :size => 50 } )
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options,
                                            :width => options[:size],
                                            :height => options[:size])
  end

  def anonymous_image(options = { :size => 50 } )
    image_tag("Anonymous.jpg", :alt => "Sample App",
                               :class => "round",
                               :width => options[:size],
                               :height => options[:size])
  end
end
