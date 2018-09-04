class BooksController < ApplicationController

  #se utiliza para ver los datos
  #respond_to es una funcion que viene de ApplicationController
    def index
        books = Book.all
        respond_to do |format|
            format.html {render html: books, status: 200}
            format.json {render json: books, status:200}
        end
    end


    def show
        book = Book.find(params[:id])
        respond_to do |format|
            format.json {render json: book, status:200}
        end
    end
    #crea un nuevo registro para la base de datos
    def create
        book = Book.new(params_book)
        if book.save
            respond_to do |format|
                format.json {render json: book, status:201}
            end
        else
            respond_to do |format|
                format.json {render json: book.errors, status: :unprocessable_entity}
            end
        end
    end

    def params_book
        params.permit(:name, :year, :code, :avaliable)
    end

end
