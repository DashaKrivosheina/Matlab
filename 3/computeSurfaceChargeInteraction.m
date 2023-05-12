function interMat = computeSurfaceChargeInteraction(triangles, vertices, charges)

% Вычисляем векторы нормалей к граням (внешней стороне)
% Векторы нормалей должны указывать наружу поверхности.
normals = computeVertexNormals(triangles, vertices);

% Создаем матрицу взаимодействия нулями
interMat = zeros(size(vertices, 1), size(vertices, 1));

% Обходим каждую тройку вершин, если все они образуют треугольник,
% добавляем соответствующее взаимодействие в матрицу
for i = 1:size(vertices, 1)
    for j = (i + 1):size(vertices, 1)
        for k = (j + 1):size(vertices, 1)
            tri = sort([i, j, k]);
            if any(all(triangles == tri, 2))
                % Вычисляем векторы нормалей к граням внутренней стороны
                % Путем инверсии внешней стороны.
                inner_normals = -1 * normals(all(triangles == tri, 2), :);
                % Вычисляем вектор площади треугольника (нормаль к треугольнику)
                area = cross(vertices(j, :) - vertices(i, :), vertices(k, :) - vertices(i, :));
                % Вычисляем площадь треугольника
                S = norm(area)/2;
                % Вычисляем среднее значение заряда треугольника
                charge = mean(charges(tri));
                % Вычисляем взаимодействие между зарядами
                q1 = charges(i);
                q2 = charges(j);
                q3 = charges(k);
                q12 = q1 * q2 / norm(vertices(j, :) - vertices(i, :));
                q23 = q2 * q3 / norm(vertices(k, :) - vertices(j, :));
                q31 = q3 * q1 / norm(vertices(i, :) - vertices(k, :));
                potential = (q12 + q23 + q31) / (4 * pi);
                % Добавляем взаимодействие в матрицу
                interMat(i, j) = interMat(i, j) + potential * dot(inner_normals(1,:), area) * S;
                interMat(i, k) = interMat(i, k) + potential * dot(inner_normals(2,:), area) * S;
                interMat(j, k) = interMat(j, k) + potential * dot(inner_normals(3,:), area) * S;
            end
        end
    end
end

% Делаем матрицу симметричной
interMat = interMat + interMat';
interMat(1:size(interMat,1)+1:end) = diag(interMat);

end