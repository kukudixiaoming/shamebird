class MeController < ApplicationController
  def paper
    @category = Category.find_by(id: "1")
    @categories = Category.all
  end
end
