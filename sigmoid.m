function [ output_args ] = sigmoid( input_args )
output_args = exp(input_args)./(1+exp(input_args));
end

