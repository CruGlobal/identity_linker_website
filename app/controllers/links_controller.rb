require "awesome_print"
class LinksController < ApplicationController
  def index
  end

  def show
    begin
      @links = case params[:method]
                when 'find_linked_identity'
                  raise 'Missing parameter' unless [params[:id_type], params[:id], params[:target]].all?(&:present?)
                  @linker.find_linked_identity(params[:id_type], params[:id], params[:target])
                when 'find_linked_identity_with_details'
                  raise 'Missing parameter' unless [params[:id_type], params[:id], params[:target]].all?(&:present?)
                  @linker.find_linked_identity_with_details(params[:id_type], params[:id], params[:target])
                when 'find_all_linked_identities'
                  raise 'Missing parameter' unless [params[:id_type], params[:id]].all?(&:present?)
                  @linker.find_all_linked_identities(params[:id_type], params[:id])
                when 'find_all_linked_identities_with_details'
                  raise 'Missing parameter' unless [params[:id_type], params[:id]].all?(&:present?)
                  @linker.find_all_linked_identities_with_details(params[:id_type], params[:id])
                when 'find_linked_identities_of_type'
                  raise 'Missing parameter' unless [params[:id_type], params[:id], params[:target]].all?(&:present?)
                  @linker.find_linked_identities_of_type(params[:id_type], params[:id], params[:target])
                else
                  'Bad method'
                end
    rescue => e
      @links = {error: e.to_s}
    end
  end
end
