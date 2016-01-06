# To change this template, choose Tools | Templates
# and open the template in the editor.

module DateFormatting

  def self.getdaymonth(complete_date)
    date_array = complete_date.to_s.split('-');
    if (date_array.length > 0)
      formatted_date = date_array[2].to_s+"-"+date_array[1].to_s
    end
    return formatted_date
  end
  #the date containing only day and month is passed to this
  #helper function where the year is appended to it and returned.
  def self.appendyear(in_complete_date)
    complete_date = in_complete_date.to_s + "-" + "2012"
  end

end
