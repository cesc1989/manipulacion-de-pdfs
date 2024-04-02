class CombineController < ApplicationController
  def index
    WithCombine.new.generate
  end
end
