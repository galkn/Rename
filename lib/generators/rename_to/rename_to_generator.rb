class RenameToGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :new_name, :type => :string, :default => "#{Rails.application.class.parent}"
  
  def rename_to
    old_name = "#{Rails.application.class.parent}"
    new_name_capitalized = new_name.downcase.gsub(/\s/, "_").camelize.capitalize
    
    puts "Renaming app from #{old_name} to #{new_name_capitalized}"
    
    in_root do
      gsub_file 'config/application.rb', /(module) (#{Regexp.escape(old_name)})/mi do |match|
        "module #{new_name_capitalized}"
      end
      
      gsub_file 'config/environment.rb', /(#{Regexp.escape(old_name)})(::Application.initialize!)/mi do |match|
        "#{new_name_capitalized}::Application.initialize!"
      end
      
      environments = ['development', 'production','test']
      for environment_name in environments
        gsub_file "config/environments/#{environment_name}.rb", /(#{Regexp.escape(old_name)})(::Application.configure)/mi do |match|
          "#{new_name_capitalized}::Application.configure"
        end
      end
      
      gsub_file 'config/routes.rb', /(#{Regexp.escape(old_name)})(::Application.routes)/mi do |match|
        "#{new_name_capitalized}::Application.routes"
      end
      
      gsub_file 'config.ru', /(run) (#{Regexp.escape(old_name)})(::Application)/mi do |match|
        "run #{new_name_capitalized}::Application"
      end
      
      gsub_file 'config/initializers/secret_token.rb', /(#{Regexp.escape(old_name)})(::Application.config.secret_token)/mi do |match|
        "#{new_name_capitalized}::Application.config.secret_token"
      end
      
      gsub_file 'config/initializers/session_store.rb', /(#{Regexp.escape(old_name)})(::Application.config.session_store)/mi do |match|
        "#{new_name_capitalized}::Application.config.session_store"
      end
      
      gsub_file 'Rakefile', /(#{Regexp.escape(old_name.capitalize)})(::Application.load_tasks)/mi do |match|
        "#{new_name_capitalized}::Application.load_tasks"
      end
    end
  end
end
