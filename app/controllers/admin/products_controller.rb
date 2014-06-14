class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    # todo : 要改成 user has many :products, 不然誰登入後知道路徑都可以刪除?
    @product = Product.new(product_params)

    if @product.save

      # single upload
      # if params[:product][:photo]
      #   @product.photos.create(image: params[:product][:photo])
      # end

      if params[:product][:photos_attributes]

        @photos_attrs = params[:product][:photos_attributes]
        @photos_attrs.each do |photo_attr|
          # check destroy status and photo is exist
          if photo_attr[1][:_destroy] == 'false' && photo_attr[1][:photo] != nil
            @product.photos.create(image: photo_attr[1][:photo])
          end
        end
      end

      redirect_to admin_products_path

    else
      render :new
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    # todo : 要改成 user has many :products, 不然誰登入後知道路徑都可以刪除?
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, tasks_attributes: [:id, :name, :_destroy])
  end

  def admin_required
    if !current_user.is_admin
      flash[:alert] = 'you have no permission!'
      redirect_to root_url
    end
  end

end
