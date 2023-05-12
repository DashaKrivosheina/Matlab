function invDistMat = computeInvDistMatrix(triangles, vertices)
% Рассчитываем евклидовы расстояния между всеми парами вершин
distMat = sqrt(sum((vertices - vertices').^2, 2));

% Инициализируем матрицу обратных расстояний нулями
invDistMat = zeros(size(vertices, 1));

% Обходим каждую тройку вершин, если все они образуют треугольник, 
% добавляем обратное расстояние между ними в матрицу
for i = 1:size(vertices, 1)
    for j = (i + 1):size(vertices, 1)
        for k = (j + 1):size(vertices, 1)
            tri = sort([i, j, k]);
            if any(all(triangles == tri, 2))
                invDistMat(i, j) = invDistMat(i, j) + 1/distMat(i, j);
                invDistMat(i, k) = invDistMat(i, k) + 1/distMat(i, k);
                invDistMat(j, k) = invDistMat(j, k) + 1/distMat(j, k);
            end
        end
    end
end

% Делаем матрицу симметричной
invDistMat = invDistMat + invDistMat';
invDistMat(1:size(invDistMat,1)+1:end) = diag(invDistMat);

% Нормируем обратные расстояния
invDistMat = invDistMat./max(invDistMat(:));
end
