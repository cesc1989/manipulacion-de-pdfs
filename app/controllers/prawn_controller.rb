class PrawnController < ApplicationController
  def index
  end

  def generate
    WithPrawn.new.generate
  end
end
