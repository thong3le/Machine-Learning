function [h, display_array] = displayData(X, example_width)
% displays 2D data, stored in X in a nice grpid, it returns the figure
% handle h and the displayed array if requested.

% set example_width automatically if not passed in 
if ~exist('example_widtth', 'var') || isempty(example_width)
    example_width = round(sqrt(size(X, 2)));
end

colormap(gray);

[m, n] = size(X);
example_height = (n / example_width);

display_rows = floor(sqrt(m));
display_cols = ceil( m / display_rows);

pad = 1;

display_array = -ones(pad + display_rows * (example_height + pad), pad + display_cols * (example_width + pad));

curr_ex = 1;
for j = 1:display_cols
    for i = 1:display_cols
        if curr_ex > m,
            break;
        end
        
        max_val = max(abs(X(curr_ex, :)));
        display_array(pad + (j-1) * (example_height + pad) + (1:example_height), pad + (i-1) * (example_width + pad) + (1:example_width)) = ...
                reshape(X(curr_ex, :), example_height, example_width) / max_val;
        curr_ex = curr_ex + 1;
    end
    if curr_ex > m,
        break;
    end
end

h = imagesc(display_array, [-1,1]);

%do not show axis
axis image off

drawnow;

end

