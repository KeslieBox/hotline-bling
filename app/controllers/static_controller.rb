class StaticController < ApplicationController
    def home
        @dispatcher = Dispatcher.new
    end
end