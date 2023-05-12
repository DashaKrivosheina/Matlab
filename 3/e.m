function vertexAreas = computeVertexAreas(triangles, vertices)
% Вычисляем площадь каждого треугольника
edges1 = vertices(triangles(:, 2), :) - vertices(triangles(:, 1), :);
edges2 = vertices(triangles(:, 3), :) - vertices(triangles(:, 1), :);
crossProd = cross(edges1, edges2);
triangleAreas = 0.5*sqrt(sum(crossProd.^2, 2));

% Инициализируем площадь каждой вершины нулем
vertexAreas = zeros(size(vertices, 1), 1);

% Добавляем площадь каждого треугольника к площадям соответствующих вершин
for i = 1:size(triangles, 1)
    vertexAreas(triangles(i, 1:3)) = vertexAreas(triangles(i, 1:3)) + triangleAreas(i)/3;
end

end
