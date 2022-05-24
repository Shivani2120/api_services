class BooksController < ApplicationController
   def index
    @books = Book.all
   end
   
   def new
    @book = Book.new
   end

   def show
    @book = Book.find(params[:id])
   end

   def edit
     @book = Book.find(parms[:id])
   end

   def create
      BookCreator.new(title: params[:book][:title], description: params[:book][:description], author_id: params[:book][:author_id], genre_id: params[:book][:genre_id]).create_book
   end

   def destroy
     @book = Book.find(params[:id])
     @book.destroy

     redirect_to books_path
   end

   def update
    if @book.update(title: params[:title], description: params[:description], author_id: params[:author_id], genre_id: params[:genre_id])
        redirect_to books_path
    else
        render :edit
    end
   end

end
