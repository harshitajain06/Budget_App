class TransacsController < ApplicationController
    before_action :authenticate_user!
    def index
     @transacs = Transac.all.where(author_id: current_user.id).order(created_at: :desc)
    end
  
    def show
        @transac = Transac.find_by(id: params[:id])
    end
  
    def new
        @transac = Transac.new
        @categories = Category.where(author: current_user)
        return unless params[:category_id]
        @category = Category.find(params[:category_id])
    end

    def create
        @transac = Transac.new(transac_params)
        @transac.author = current_user
        @category = Category.find(params[:transac][:category_id])
        @transac.categories << @category
        if @transac.save
          redirect_to category_url(params[:transac][:category_id]), notice: 'Transaction was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      private
    
      # Only allow a list of trusted parameters through.
      def transac_params
        params.require(:transac).permit(:name, :amount)
      end

end