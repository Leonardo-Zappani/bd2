# frozen_string_literal: true

module Table
  class TableComponent < ApplicationComponent

    renders_one :header, 'Table::HeaderComponent'
    renders_many :bodies, 'Table::BodyComponent'

    def initialize(options: {})
      super
      @options = options
    end
  end
end
