# = Encapsulating Script.aculo.us <tt>Ajax.Autocompleter</tt> method
# Over-ride the CSS in your stylesheets with a more specific selector, like <tt>.my-page div.autocomplete { color: red }</tt>

module TaggableHelper

  # Returns <tt><div></tt>, CSS and JavaScript code needed for autocompleting tags
  # See http://github.com/madrobby/scriptaculous/wikis/ajax-autocompleter
  def taggable_autocompleter_for(field_name, options={})
    authenticity_token_param = protect_against_forgery? ? "authenticity_token=#{form_authenticity_token}" : '' # Beware of tests :)
    autocompleter=<<HTML
    <style type="text/css" media="screen">
      div.autocomplete {
        position:absolute; width:250px;
        background-color: white;
        border:1px solid #888; margin:0; padding:0; }
      div.autocomplete ul { list-style-type:none; margin:0; padding:0; }
      div.autocomplete ul li.selected { background-color: #ecf4fe;}
      div.autocomplete ul li { display: block; margin: 0; padding: 0.2em; height: 1em; cursor: pointer; }
    </style>
     <div id="#{field_name}_autocomplete_choices" class="autocomplete"></div>
     <script type="text/javascript">
       new Ajax.Autocompleter("#{field_name}",
                              "#{field_name}_autocomplete_choices",
                              "/taggable/autocomplete?#{authenticity_token_param}",
                              { paramName: 'autocomplete_tag', tokens: ',' }
                             );
     </script>
HTML
    return autocompleter
  end

end