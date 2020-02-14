class Api::CategoriesController < ApplicationController
def index
 @categories = Category.find(params[:keyword]).children
end


end
