class FreeformController < ApplicationController
  def index
    free_form = FreeForm.all
    render json: free_form.as_json
  end

  def show
    index_of_text = params[:id]
    free_form = FreeForm.find_by(id: index_of_text)
    render json: free_form.as_json
  end

  def create
    new_free_form = FreeForm.new({
      ff_text: params[:ff_text]
      })

    if new_free_form.save
      render json: new_free_form.as_json
    else
      render json: {errors: new_free_form.errors.full_message}
    end
  end

  def update
    index_of_text = params[:id]
    ff_text = FreeForm.find_by(id: index_of_text)
    ff_text["ff_text"] = params["ff_text"] || ff_text["ff_text"]

    if ff_text.save
      render json: ff_text.as_json
    else
      render json: {errors: ff_text.errors.full_message}
    end
  end

  def destroy
    index_of_text = params[:id]
    ff_text = FreeForm.find_by(id: index_of_text)
    ff_text.destroy
  end

  def create_many
    p '-----------------------------'
    p params
    p '-----------------------------'
  end



end
