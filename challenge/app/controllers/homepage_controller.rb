# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    svg_file = params[:path] # Retrieve the parameter indicating which SVG file to render

    respond_to do |format|
      format.html # Handle HTML format normally
      format.svg do
        # Check if the requested SVG file exists
        if svg_file.present? && File.exist?(Rails.root.join('app', "#{svg_file}.svg"))
          render inline: File.read(Rails.root.join('app', "#{svg_file}.svg")) # Render the requested SVG file
        else
          head :not_found # Return a 404 status code if the requested SVG file does not exist
        end
      end
    end
  end
end
