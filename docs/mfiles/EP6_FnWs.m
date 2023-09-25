function output = EP6_FnWs(a,b)
output(1) = a + b;
output(2) = nested_fn(a,b);

disp('Output from whos is below in EP6_FnWs')
whos
disp('-------------end---------------')

% nested function
    function output_n = nested_fn(a_n,b_n)
        output_n = (a_n*b_n);
        disp('Output from whos is below in nested function')
        whos
        disp('-------------end---------------')
    end
end