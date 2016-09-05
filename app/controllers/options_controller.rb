class OptionsController < ApplicationController
  def new
    @options = Option.all
    if @options.count == 1
      redirect_to edit_option_url(1)
    end
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    if @option.save
      redirect_to option_edit_url
    else
      render "new"
    end
  end

  def show
    @option = Option.find(params[:id])
  end

  def edit
    @option = Option.find(params[:id])
    if @option.update
      redirect_to options_show_url
    else
      render "edit"
    end
  end

private

def option_params
  params.require(:option).permit(:site_header, :site_sub_header, :user_name, :password, :email)
end

end
