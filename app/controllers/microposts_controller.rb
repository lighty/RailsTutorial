class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_parameters)
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_url
    else
      redirect_to 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def micropost_parameters
      params.require(:micropost).permit(:content)
    end
end
