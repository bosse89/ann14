clear;
width = 40;
weights = rand(width,width,3); % i.e. colormap
%input = [1 0 0;0 1 0];
input = [1 0 0;0 0 1;0 1 0];
eta = 0.025;
epochs = 200;

imagesc(weights)
pause(1)
winnerid = 0;
for e=1:epochs
    radius = floor(1.5*width*(epochs-e)/epochs)+1;
    %radius = 2;
    %for i=1:size(input,1) % for each training example
    for i=ceil(random('u',0,size(input,1)))
        x = input(i,:);
        inputmatrix = zeros(width,width,3);
        sqdiff = zeros(width,width);
        for yi=1:width
            for xi=1:width
                inputmatrix(yi,xi,:) = x;
                sqdiff(yi,xi) = sum((weights(yi,xi,:)-inputmatrix(yi,xi,:)).^2);
            end
        end
    
        [rowmin,rowargmin] = min(sqdiff,[],2);
        [colmin,colargmin] = min(rowmin,[],1);
        winnerx = colargmin
        winnery = rowargmin(colargmin)
        
        %weights
        %inputmatrix
        %sqdiff
        %pause(1)

        neighbours = getNeighboursEuclidean([width width],[winnery,winnerx],radius)

        for n=neighbours'
            nx = n(1);
            ny = n(2);
            weights(ny,nx,:) = weights(ny,nx,:)+eta*(inputmatrix(ny,nx,:)-weights(ny,nx,:));
        end
    end
    imagesc(weights); hold on;
    plot([winnerx,neighbours(:,1)'],[winnery,neighbours(:,2)'],'*')
    pause(0.01)
end
imagesc(weights)
disp('the end')