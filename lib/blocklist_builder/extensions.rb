# frozen_string_literal: true

class String
  def underscore
    gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end

  def pascalcase
    split('_').map { |s| s[0].upcase + s[1..-1] }.join ''
  end
end
