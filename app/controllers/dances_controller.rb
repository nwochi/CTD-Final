class DancesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
        
     def index
        @dances = Dance.all
     end
    
     def show
        @dance = Dance.find(params[:id])
        # render text: @phrase.name
     end
    
     def new
        @dance = Dance.new
     end
    
     def create
        dance_params = params.require(:dance).permit(:title, :description)
        @dance = Dance.new(dance_params)
        if @dance.save
            flash.notice = "Your new dance record was created successfully!"
            redirect_to @dance
        else
            flash.notice = "Something is wrong with your dance; please try again."
            render :new
        # else
        #     flash.now.alert = @dance.errors.full_messages.to_sentence
        #     render :new
        end
     end
    
     def edit
        @dance = Dance.find(params[:id])
     end
    
     def update
        @dance = Dance.find(params[:id])
        
        if @dance.update(dance_params)
            flash.notice = "Your dance was updated successfully!"
            redirect_to @dance
        else
          flash.now.alert = @dance.errors.full_messages.to_sentence
          render :edit
        end
        # if @dance.dance_to_phrases.update(phrase: dance_params[:phrase_name], position: dance_params[:position])
        # # @dance.title(title: dance_params[:phrase_name], position: dance_params[:position])
        # #params.require(:dance).permit(:title, :description)
        # #if @dance.dance_to_phrases.update(dance_params)
        #     flash.notice = "Your dance record was updated successfully!"
        #     redirect_to @dance
        # else
        #     flash.now.alert = @dance.errors.full_messages.to_sentence
        #     render :edit
        # end
        # # @dance.update(dance_params)
        # # redirect_to @dance
     end
     
     def add_phrase_name
         @dance = Dance.find(params[:id])
         @dance.dance_to_phrases.create(name: dance_params[:phrase_name], position: dance_params[:position], phrase_id: dance_params[:phrase_id])
         redirect_to @dance
        #  params.require(:order).permit(:name, :position, :phrase_id)
     end
     
     def edit_phrases_dance
         @dance = Dance.find(params[:id])
     end
    
     def destroy
        @dance = Dance.find(params[:id])
        @dance.destroy
        respond_to do |format|
            format.html { redirect_to dances_url, notice: 'Your dance was successfully deleted.' }
            format.json { head :no_content }
        # redirect_to dance_path
        end
     end
    
     private
      def dance_params
        params.require(:dance).permit(:title, :description)
      end
      
      def set_phrase
         @dance = Dance.find(params[:id])
      end
    
    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to dance_path
    end
end

