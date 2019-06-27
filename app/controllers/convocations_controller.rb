class ConvocationsController < ApplicationController
  def create
    errors = []
    note_params[:inscription_list].each do |i|
      convocation = Convocation.new(note_params)
      convocation.inscription_id = i
      authorize convocation
      unless convocation.save
        errors << "#{convocation} error #{convocation.errors.full_message}"
      end
    end

    if errors.first.nil?
        render json: {success: true, inscriptions: InscriptionsSerializer.new(Inscription.all).serialized_json}
    else
        render json: {success: false, errors: errors}
    end
  end

  private

  def note_params
    params.require(:convocation).permit!
  end

end