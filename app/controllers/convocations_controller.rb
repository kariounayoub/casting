 class ConvocationsController < ApplicationController
  before_action :find_convocation, only: [:present]
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
        render json: {success: true, inscriptions: InscriptionsSerializer.new(policy_scope(Inscription)).serialized_json}
    else
        render json: {success: false, errors: errors}
    end
  end

  def present
    if @convocation.update(venu: true)
      render json: {success: true, convocations: ConvocationsSerializer.new(@convocation, {params: {current_user: current_user}}).serialized_json}
    else
      render json: {success: false}
    end
  end

  private

  def note_params
    params.require(:convocation).permit!
  end

  def find_convocation
    @convocation = Convocation.find(params[:id])
    authorize @convocation
  end
end
