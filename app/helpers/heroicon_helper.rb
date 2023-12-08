# frozen_string_literal: true

module HeroiconHelper
  include Heroicon::Engine.helpers

  def icon(name, variant: Heroicon.configuration.variant, options: { class: '' })
    heroicon name, variant:, options:
  end
end
