class IconsController < ApplicationController
  def index
    @icon = Icon.all
  end
  def new
    @icon = Icon.new
  end
  def create
    @icon = Icon.new(params_icon)
    @icon.save
    redirect_to icons_path
  end
  private
    def params_icon
      params.require(:icon).permit(:title,:image)
    end
end
