function drawWignerZeitzCell(a, b, c)

% вычисление двух векторов, лежащих на плоскости a и b
u = cross(a, b);
v = cross(a, u);

% вычисление вершин ячейки
vertices = zeros(6, 3);
vertices(1,:) = [0, 0, 0];
vertices(2,:) = (a + b) / 2;
vertices(3,:) = (a + c) / 2;
vertices(4,:) = (b + c) / 2;
vertices(5,:) = (a + b + c) / 3;
vertices(6,:) = (a + b - c) / 3;

% настройка фигуры
figure;
hold on;
axis equal;
axis off;
view(3);

% рисование поверхности ячейки
patch('vertices', vertices, 'faces', [1 2 3; 1 4 2; 1 3 4; 2 4 5; 3 5 4; 2 5 3], 'facecolor', 'none', 'edgecolor', 'k');

% рисование векторов a, b и c
quiver3(0, 0, 0, a(1), a(2), a(3), 'linewidth', 2, 'color', 'r');
quiver3(0, 0, 0, b(1), b(2), b(3), 'linewidth', 2, 'color', 'g');
quiver3(0, 0, 0, c(1), c(2), c(3), 'linewidth', 2, 'color', 'b');

% рисование ортогональных векторов u и v
quiver3(0, 0, 0, u(1), u(2), u(3), 'linewidth', 2, 'color', 'm');
quiver3(0, 0, 0, v(1), v(2), v(3), 'linewidth', 2, 'color', 'c');

% подписи осей и векторов
xlabel('X');
ylabel('Y');
zlabel('Z');
text(a(1), a(2), a(3), ' a');
text(b(1), b(2), b(3), ' b');
text(c(1), c(2), c(3), ' c');
text(u(1), u(2), u(3), ' u');
text(v(1), v(2), v(3), ' v');

end





