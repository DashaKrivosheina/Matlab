function vertexNormals = computeVertexNormals(triangles, vertices)
% Вычисляем векторы нормалей к треугольникам
a = vertices(triangles(:, 2), :) - vertices(triangles(:, 1), :);
b = vertices(triangles(:, 3), :) - vertices(triangles(:, 1), :);
crossProd = cross(a, b);
triangleNormals = crossProd./sqrt(sum(crossProd.^2, 2));

% Инициализируем векторы нормалей к вершинам нулем
vertexNormals = zeros(size(vertices, 1), 3);

% Вычисляем средние векторы нормалей к треугольникам для каждой вершины
for i = 1:size(vertices, 1)
    ind = any(triangles == i, 2);
    if any(ind)
        vertexNormals(i, :) = mean(triangleNormals(ind, :), 1);
        vertexNormals(i, :) = vertexNormals(i, :)./sqrt(sum(vertexNormals(i, :).^2));
    end
end

end
