function [tri, list] = a(points)

% построение триангуляции Делоне
tri = delaunay(points(1,:), points(2,:), 'Qz');

% определение граничных ребер
edge = freeBoundary(delaunayTriangulation(points'));
list = edge(:, 1);

% отображение триангуляции
scatter(points(1,:), points(2,:), 10, 'filled');
hold on;
triplot(tri, points(1,:), points(2,:), 'Color', 'blue');

% отображение граничных ребер красным цветом
plot(points(1, edge'), points(2, edge'), 'r-', 'LineWidth', 1);

hold off;

end