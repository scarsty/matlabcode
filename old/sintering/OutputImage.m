% Build the image by matrix.
function OutputImage(L, str)

x1 = [1, 0];
x2 = [1/2, sqrt(3)/2];
Off = [0, 1; 1, 0; -1, 1];

[Rn, Ln] = size(L);

record = zeros(1, 2);

k = 1;

for r = 2:Rn-1
    for l = 2:Ln-1
        for i = 1:3

            temp = [r, l] + Off(i, :);
            r1 = temp(1);
            l1 = temp(2);
            if r1 < 1
                r1 = Rn;
            end
            if l1 < 1
                l1 = Ln;
            end
            if r1 > Rn
                r1 = 1;
            end
            if l1 > Ln
                l1 = 1;
            end

            if L(r, l) ~= L(r1, l1)
                vec = (r + r1) * x1 / 2 + (l + l1) * x2 / 2;
                record(k, :) = vec;
                k = k + 1;
            end

        end
    end
end

h_fig = figure('Visible', 'off');
plot(record(:, 1), record(:, 2), '.');
axis equal;
axis([-10, 150, -10, 90]);
print(h_fig, '-dpng', str); 
close(h_fig);
