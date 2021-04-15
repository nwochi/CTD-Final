class PhrasesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_phrase, only: [:show, :edit, :update, :destroy]
    
    def index
        @phrases = Phrase.all
    end
    
    def show
        @phrases = Phrase.find(params[:id])
        # render text: @phrase.name
    end
    
    def new
        @phrases = Phrase.new
    end
    
    def create
        phrase_params = params.require(:phrase).permit(:name) #.require says that a specific parameter (a phrase) MUST be present; .permit returns an actual copy of the object
        @phrases = Phrase.new(phrase_params)
    
        @phrase.moves #this is a new line
        if @phrase.save
            flash.notice = "Your new phrase record was created successfully!"
            redirect_to @phrase
        end
    end
        # # else
        # #     flash.now.alert = @phrase.errors.full_messages.to_sentence
        # #     render :new
        # # phrase_params = params.require(:phrase).permit(:name)
        # # @phrase = Phrase.new(phrase_params)
        # # @phrase.save
        # # redirect_to @phrase
    # end
    
    def edit
        @phrases = Phrase.find(params[:id])
        # @phrase.update #this is a new line
        # @phrase.moves.create #new line
    end
    
    def update
        @phrases = Phrase.find(params[:id])
        @phrases.update(name: phrase_params[:name]) #(phrase_params)
        redirect_to @phrases
        # if @phrase.moves.update(name: phrase_params[:move_name], position: phrase_params[:position])
        
        #if @phrase.update(phrase_params)
        #     flash.notice = "Your phrase record was updated successfully!"
        #     redirect_to @phrase
        # else
        #     flash.now.alert = @phrase.errors.full_messages.to_sentence
        #     render :edit
        # end
        # @phrase = Phrase.find(params[:id])
        # # params.require(:phrase).permit(:name)
        # @phrase.moves.create(name: phrase_params[:move_name],position: phrase_params[:position])
        # redirect_to @phrase
    end
    
    def add_move
        @phrase.moves.update(name: phrase_params[:move_name], position: phrase_params[:position])
    end
    
    def destroy_move
        @phrase.moves.delete(@move)
    end
    
    def destroy
        @phrases = Phrase.find(params[:id])
        @phrases.destroy
        # @phrases.moves.delete(@move)
        
        
        # respond_to do |format|
        #     format.html { redirect_to phrases_url, notice: 'Your phrase was successfully destroyed.' }
        #     format.json { head :no_content }
        #end
        
        # @phrase = Phrase.find(params[:id])
        # @phrase.destroy
        # redirect_to phrase_path
    end
    
    private
    def phrase_params
        params.require(:phrase).permit(:name, :move_name, :position)
    end
    
    def set_phrase
         @phrases = Phrase.find(params[:id])
    end
    
    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to phrase_path
    end
end
