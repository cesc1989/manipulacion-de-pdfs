class WickedpdfController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'prueba_wickedpdf',
               layout: 'pdf'
      end
    end
  end
end
