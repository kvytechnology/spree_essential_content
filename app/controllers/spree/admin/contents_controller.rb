module Spree
  module Admin
    class Spree::Admin::ContentsController < Spree::Admin::ResourceController
      before_action :load_resource
      before_action :parent, only: :index

      before_action :load_data, only: [ :new, :edit, :create, :update ]

      belongs_to 'spree/page'

      def update_positions
        @page = parent
        params[:positions].each do |id, index|
          Spree::Content.where('id = ?', id).update_all(position: index)
        end

        respond_to do |format|
          format.html { redirect_to admin_page_contents_url(@page) }
          format.js  { render text: 'Ok' }
        end
      end

      private

        def load_data
          @pages = Spree::Page.order(:position).all
        end

        def parent
    	    @page ||= Spree::Page.where(path: params[:page_id]).first
        end

        def collection
          params[:q] ||= {}
          params[:q][:s] ||= "position asc"
          @search = parent.contents.search(params[:q])
          @collection = @search.result.page(params[:page]).per(Spree::Config[:products_per_page])
        end
    end
  end
end