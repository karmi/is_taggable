# = Return autocomplete results for the Tag class from is_taggable plugin
# Add before_filters, copy it somewhere else, etc, as you like.
# Just don't forget the <tt>app/views/taggable/autocomplete.js.erb</tt> file as well
# 
class TaggableController < ApplicationController

  # Return autocomplete results
  def autocomplete
    @autocomplete_tags = Tag.all( :conditions => ['name LIKE ?', "#{params[:autocomplete_tags]}%"], :order => 'name', :limit => 50)
    respond_to do |format|
      format.js { render :template => "autocomplete", :layout => false }
    end
  end

end