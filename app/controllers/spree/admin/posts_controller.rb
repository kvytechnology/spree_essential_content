module Spree
  module Admin
    class PostsController < ResourceController

      helper "spree/blogs/posts"

      update.before :set_category_ids

      def new
        @post = Spree::Post.new
        @post.posted_at ||= Time.now
      end

      def show
        @post ||= Spree::Post.find_by_path(params[:id])

        redirect_to edit_admin_post_path @post
      end

      private

      def set_category_ids
        if params[:post] && params[:post][:post_category_ids].is_a?(Array)
          params[:post][:post_category_ids].reject!{|i| i.to_i == 0 }
        end
      end

      def location_after_save
        admin_posts_url
      end

      def find_resource
        @object ||= Spree::Post.find_by_path(params[:id])
      end

      def collection
        params[:q] ||= {}
        params[:q][:s] ||= "posted_at desc"
        @search = Spree::Post.search(params[:q])
        @collection = @search.result.page(params[:page]).per(Spree::Config[:products_per_page])
      end
    end
  end
end