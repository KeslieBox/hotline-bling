
[1mFrom:[0m /home/idmiod/Development/code/Phase3/hotline-bling/app/controllers/calls_controller.rb:14 CallsController#create:

    [1;34m13[0m: [32mdef[0m [1;34mcreate[0m 
 => [1;34m14[0m:     binding.pry
    [1;34m15[0m:     @call = [1;34;4mCall[0m.new(call_params)
    [1;34m16[0m:     
    [1;34m17[0m:     [32mif[0m @call.save 
    [1;34m18[0m:         redirect_to calls_path
    [1;34m19[0m:     [32melse[0m 
    [1;34m20[0m:         @errors = @call.errors.full_messages
    [1;34m21[0m:         @errors = @caller.errors.full_messages
    [1;34m22[0m:         render [33m:new[0m
    [1;34m23[0m:     [32mend[0m
    [1;34m24[0m: [32mend[0m

