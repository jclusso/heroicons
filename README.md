# Heroicons

[![Gem Version](https://badge.fury.io/rb/heroicons.svg)](https://rubygems.org/gems/heroicons)
[![Build Status](https://github.com/jclusso/heroicons/workflows/CI/badge.svg)](https://github.com/jclusso/heroicons/actions)

Ruby on Rails view helpers for the beautiful hand-crafted SVG icons, Heroicons.

This gem has no official affiliation with Tailwind CSS or the Heroicons team. Check out their sites:

- [Tailwind CSS](https://tailwindcss.com/?utm_source=jclusso_heroicons_github)
- [Tailwind UI](https://tailwindui.com/?utm_source=jclusso_heroicons_github)
- [Heroicons](https://heroicons.com/?utm_source=jclusso_heroicons_github)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "heroicons"
```

And then execute:

```bash
$ bundle
```

Run the installer

```bash
$ rails g heroicons:install
```

## Usage

To use a icon in your views, simply use the provided view helper with the name of an icon.

```rb
<%= heroicon "magnifying-glass" %>
```

Heroicons comes with 4 variants, `:outline`, `:solid`, `:mini`, and `:micro`. The default variant is `:solid`. This can be changed in `config/initializers/heroicons.rb`, which is generated during installation (See [Configuration](#configuration)). To overwrite this in the view, use

```rb
<%= heroicon "magnifying-glass", variant: :outline %>
```

You can also pass HTML options directly to the icon.

```rb
<%= heroicon "magnifying-glass", options: { class: "text-primary-500" } %>
```

Heroicons currently supports icons matching [`Version 2.1.3`](https://github.com/tailwindlabs/heroicons/releases/tag/v2.1.3). If there is an icon that is missing or a new version released, feel free to contribute by following our contributing guide below.

# Configuration

After running `rails g heroicons:install` in the installation step, a configuration file will be created at `config/initializers/heroicons.rb`.

Currently there are two configuration options:

- `variant`: The default variant to use if no variant is specified in the view.
  - You can set this to either `:outline`, `:solid`, `:mini`, or `:micro`. Defaults to `:solid`.
- `default_class`: A default class that gets applied to every icon.
  - This accepts either a String to apply to every icon, or a Hash, which applies the class based on the variant of the icon (see the example below).
  - You can disable this on a per-icon basis by passing `disable_default_class: true` in the options hash within the view.

**Note:** If you enable the `default_class` config, make sure to include `config/initializers/heroicons.rb` in the list of purged paths. For TailwindCSS 3.0+, you should have something like this in your `tailwind.config.js`:

```js
module.exports = {
  //...
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
    './config/initializers/heroicons.rb', // 👈
  ],
  //...
}
```

An example configuration looks like this:

```ruby
Heroicons.configure do |config|
  config.variant = :solid
  config.default_class = {
    solid: "size-6",
    outline: "size-6",
    mini: "size-5",
    micro: "size-4",
  }
end
```

Disabling the default class in the view:

```rb
<%= heroicon "magnifying-glass", options: { class: "custom-class", disable_default_class: true } %>
```

## Contributing

Anyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/jclusso/heroicons/issues)
- Fix bugs and [submit pull requests](https://github.com/jclusso/heroicons/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development:

```
git clone https://github.com/jclusso/heroicons.git
cd heroicons
bundle install
bundle exec rake test
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
