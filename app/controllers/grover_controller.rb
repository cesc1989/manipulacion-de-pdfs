class GroverController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        html = ActionController::Base.new.render_to_string(
          template: 'grover/index',
          layout: 'pdf',
        )
        redirect_to Grover.new(html).to_pdf
      end
    end
  end
end
