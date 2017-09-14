module MemosHelper
  def country_list
    @list = ISO3166::Country.find_all_countries_by_region('Europe').collect{ |i| ["#{i.emoji_flag} #{i.name}(#{i.alpha3})",i.name]}
  end

  def country_by_name(name)
    i = ISO3166::Country.find_country_by_name(name)
    "#{i.emoji_flag} #{i.name}(#{i.alpha3})"
  end
  def file_name(doc_display)
     doc_display.nil? ? "" : doc_display.split("/").last
  end

end
