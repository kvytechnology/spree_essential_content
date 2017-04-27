module SpreeEssentialContent
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_essential_content'

    #initializer "spree.essential_content.preferences", :before => :load_config_initializers do |app|
    #  Spree::EssentialContent::Config = Spree::BlogConfiguration.new
    #end

    initializer "spree.essential_content.paperclip", :before => :load_config_initializers do |app|
      Paperclip::Attachment.default_options.merge!(
        :style => :medium
      )
    end

    config.autoload_paths += %W(#{config.root}/lib)
    # config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    config.to_prepare do
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob File.expand_path("../../../app/overrides/**/*.rb", __FILE__) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

  end
end
