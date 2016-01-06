module GraduateStudents::MsCoursesHelper
  #def button(name,url,parameters)
  def button(*args)
    if args.size == 4
      name = args[0]
      url = args[1]
      parameters = args[2]
      stylesheet = args[3]
      url_string = "window.location.href =  '#{url_for(url)}?"
      parameters.each do |key,value|
        url_string << "#{key}=#{value}&"
      end      
      url_string = url_string[0...-1]
      url_string << "'; "
      content_tag :button, :type => "button", :class=>stylesheet[:class], :onclick => url_string do
        "#{name}"
      end
    elsif args.size == 3
      name = args[0]
      url = args[1]
      stylesheet = args[2]
      content_tag :button, :type => "button", :class=>stylesheet[:class], :onclick => "window.location.href =  '#{url_for(url)}'; " do
        "#{name}"
      end
    elsif args.size == 2
      name = args[0]
      stylesheet = args[1]
      content_tag :button, :type => "button", :class=>stylesheet[:class] do
        "#{name}"
      end
    end
  end
end