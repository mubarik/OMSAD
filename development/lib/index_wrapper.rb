# To change this template, choose Tools | Templates
# and open the template in the editor.

class IndexWrapper
  
  def initialize(id,imgclass,imgsrc,title,l_1="",h_1="",l_2="",h_2="",l_3="",h_3="",l_4="",h_4="",assign=false,controller)
    @id = id
    @imgclass = imgclass
    @imgsrc = imgsrc
    @assign = assign
    @title = title
    @l_1   = l_1
    @l_2   = l_2
    @l_3   = l_3
    @l_4   = l_4
    @h_1   = h_1
    @h_2   = h_2
    @h_3   = h_3
    @h_4   = h_4
    @controller = controller
  end

  def assign
    return @assign
  end
  def id    
    return @id
  end

  def imgclass
    return @imgclass
  end

  def imgsrc
    return @imgsrc
  end

  def title
    return @title
  end

  def l_1
    return @l_1
  end

  def l_2
    return @l_2
  end

  def l_3
    return @l_3
  end

  def l_4
    return @l_4
  end

  def h_1
    @h_1 = empty_check(@h_1)
    return @h_1
  end

  def h_2
    @h_2 = empty_check(@h_2)
    return @h_2
  end

  def h_3
    @h_3 = empty_check(@h_3)
    return @h_3
  end

  def h_4
    @h_4 = empty_check(@h_4)
    return @h_4
  end

  def empty_check(h)
    if h.nil?
       h = "Not Provided"
    end
    return h
  end

  def controller
    return @controller
  end
end

