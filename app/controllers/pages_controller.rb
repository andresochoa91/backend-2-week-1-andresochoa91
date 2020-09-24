class PagesController < ApplicationController

  # before_action :set_page, except: [:index, :new, :create]
  before_action :set_page, only: [:show, :edit, :update, :destroy] #Same that above

  def index
    @pages = Page.all
  end

  def show
    # @page = Page.find(params[:id])   #replaced by before_action and set_page method
    # render text: @page.title
  end

  def new
    @page = Page.new
  end

  def create
    # page_params = params.require(:page).permit(:title, :body, :slug) #not needed with page_params method
    @page = Page.new(page_params)
    @page.save
    redirect_to @page
  end

  def edit
    # @page = Page.find(params[:id])
  end

  def update
    # @page = Page.find(params[:id])
    # page_params = params.require(:page).permit(:title, :body, :slug)
    @page.update(page_params)
    redirect_to @page
  end

  def destroy
    # @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  private #It is better having privite to just use it in pages controller class
    def page_params
      params.require(:page).permit(:title, :body, :slug)
    end

    def set_page
      @page = Page.find(params[:id])
    end
    
    
end
