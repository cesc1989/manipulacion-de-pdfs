class DhalangController < ApplicationController
  def index
  end

  def convert
    url = request.base_url + dhalang_path
    pdf = Dhalang::PDF.get_from_url(url)
    file_name = "prueba_dhalang"

    File.open("#{Rails.root}/public/#{_file_name}.pdf", "w+b") << pdf

    redirect_to "/#{file_name}.pdf"
  end
end
