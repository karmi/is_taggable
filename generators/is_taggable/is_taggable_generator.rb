class IsTaggableGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|

      # * Generate migration
      # m.migration_template 'migration.rb', "db/migrate", {
      #   :assigns => { :migration_name => 'CreateTaggables' },
      #   :migration_file_name => 'create_taggables'
      # }

      # * Generate controller and view for Scriptaculous autocompleter
      if options[:with_autocompleter]
        m.file 'taggable_controller.rb', 'app/controllers/taggable_controller.rb', :collision => :skip
        m.directory 'app/views/taggable'
        m.file 'autocomplete.js.erb', 'app/views/taggable/autocomplete.js.erb', :collision => :skip
      end

    end
  end

  private

  def banner
    "\nUsage: script/generate is_taggable . [options]\n\n"
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--with-autocompleter",
      "Generate controller and view for autocompleting tags") { |v| options[:with_autocompleter] = v }
  end

end
