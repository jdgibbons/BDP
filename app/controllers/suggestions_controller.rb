class SuggestionsController < ApplicationController
  autocomplete :customer, :name

end
