module I18n
  
  class << self
    def translate_message(option, model)
      I18n.t option, :model => I18n.t("activerecord.models.#{model}.one")
    end
    alias_method :tm, :translate_message
  end
  
end
