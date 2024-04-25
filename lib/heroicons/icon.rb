module Heroicons
  class Icon
    attr_reader :name, :variant, :options, :path_options

    def initialize(name:, variant:, options:, path_options:)
      @name = name
      @variant = safe_variant(variant)
      @options = options
      @path_options = path_options
    end

    def render
      return warning unless file.present?

      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css "svg"

      path_options.each do |key, value|
        attribute = key.to_s.dasherize
        svg.css("path[#{attribute}]").each do |item|
          item[attribute] = value.to_s
        end
      end

      prepend_default_class_name

      options.each do |key, value|
        svg[key.to_s.dasherize] = value
      end

      doc
    end

    private

    ##
    # Prepends the default CSS class name for an icon. You can provide a String, which will apply
    # to all icons, or a Hash, which will apply to the specified variant.
    #
    # @example
    #   Heroicons.configure do |config|
    #     config.default_class = { solid: "size-5", outline: "size-6", mini: "size-4", micro: "size-4" }
    #   end
    #
    #   #=> <svg class="size-5">...</svg>
    def prepend_default_class_name
      return if disable_default_class?

      options[:class] = combine_classes_with_default_class if default_class.present?
    end

    def combine_classes_with_default_class
      default_class_list&.concat(additional_class_list)&.uniq&.join(" ")
    end

    def default_class_list
      default_class&.blank? ? [] : default_class&.strip&.split&.compact
    end

    def additional_class_list
      options[:class].blank? ? [] : options[:class]&.strip&.split&.compact
    end

    def default_class
      if default_class_config.is_a?(String)
        default_class_config
      elsif default_class_config.is_a?(Hash)
        default_class_config[variant]
      else
        ""
      end
    end

    def default_class_config
      @default_class_config ||= Heroicons.configuration.default_class
    end

    def disable_default_class?
      @disable_default_class ||= !!options.delete(:disable_default_class)
    end

    def safe_variant(provided_variant)
      if %i[solid outline mini micro].include?(provided_variant.to_sym)
        provided_variant
      else
        :solid
      end
    end

    def file
      @file ||= File.read(file_path).force_encoding("UTF-8")
    rescue
      nil
    end

    def file_path
      File.join(Heroicons.root, "app/assets/images/heroicons/#{variant}/#{name}.svg")
    end

    def warning
      return unless Rails.env.development?

      script = <<-HTML
      <script type="text/javascript">
      //<![CDATA[
      console.warn("Heroicons: Failed to find heroicon: #{name}")
      //]]>
      </script>
      HTML

      script.strip
    end

    class << self
      def render(**kwargs)
        new(**kwargs).render
      end
    end
  end
end
