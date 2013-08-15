class PhrasesController < ApplicationController
  def new
    render partial: "themes/phrase_field", locals: { id: nil,
                                                  body: "",
                                                  index: "index" }
  end
end