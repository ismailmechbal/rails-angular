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

    def create
      note = Note.new(note_params)
      if note.save
        render json: note, status: 200
      else
        render json: { errors: note.errors }, status: 422
      end
    end

    def update
      note = Note.find(params[:id])
      if note.update(note_params)
        render json: note, status: 200
      else
        render json: { errors: note.errors }, status: 422
      end
    end

    def destroy
      note = Note.find(params[:id])
      if note.destroy
        render json: { status: 200 }
      else
        render json: { errors: note.errors }, status: 422
      end
    end

    private

    def note_params
      params.require(:note).permit(:title, :body, :category_id)
    end
  end
end