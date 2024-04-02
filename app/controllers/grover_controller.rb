class GroverController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        html = ActionController::Base.new.render_to_string(
          template: 'grover/index',
          layout: 'grover',
        )
        send_data Grover.new(html, emulate_media: 'screen').to_pdf, type: 'application/pdf', disposition: 'inline'
      end
    end
  end
end
