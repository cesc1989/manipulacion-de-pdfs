class DhalangController < ApplicationController
  def index
  end

  def convert
    url = request.base_url + dhalang_path
    pdf = Dhalang::PDF.get_from_url(url)
    file_name = "prueba_dhalang"

    File.open("#{Rails.root}/storage/#{file_name}.pdf", "w+b") << pdf

    send_data "#{file_name}.pdf", type: 'application/pdf', disposition: 'inline'
  end
end
