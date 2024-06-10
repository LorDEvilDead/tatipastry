# frozen_string_literal: true

module Core
  class Service
    def call(*)
      raise NotImplementedError
    end
  end
end
