module Admin::AssetsHelper

  def icon_document_ext(record)
    File.extname(record.document_file_name).split(".").join.downcase
  end
end
