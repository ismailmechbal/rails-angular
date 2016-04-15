module Api::V1
  class NotesController < ApiController

    # GET /v1/notes
    def index
      render json: Note.limit(5)
    end

    def show
      note = Note.find(params[:id])
      render json: note
    end
  end
end