class IsTaggableGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|

      # * Generate migration
      m.migration_template 'migration.rb', "db/migrate", {
        :assigns => { :migration_name => 'CreateTaggables' },
        :migration_file_name => 'create_taggables'
      }

    end
  end

  private

  def banner
    "\nUsage: script/generate is_taggable . [options]\n\n"
  end

end
