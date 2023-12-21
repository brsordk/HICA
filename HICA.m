function HICA(Input,CN)
% <Input>
% Input: The image directory - images files to be clustered
% CN: Cluster Number - Expected cluster number

% <Output>
% d: Resulting dendrogram with different clusters
% T: Table that specifies the clusters for each input data - saved as
% 'HICA_Clusters.xlsx' MS Excel file
% figure 2: Images that are in Cluster 1
% figure 3: Images that are in Cluster 2
% figure 4: Images that are in Cluster 3
% figure 5: Images that are in Cluster 4
% figure 6: Images that are in Cluster 5

% <Dependencies>
% This function requires the following MATLAB Toolboxes to be installed:
%  - Statistics and Machine Learning Toolbox
%  - Computer Vision Toolbox
%  - Image Processing Toolbox

% <Copyright>
% Author:   Baris Ördek
% Contact:  boerdek@unibz.it - barisordek@gmail.com
% Update:   05/12/2023
% Version:  3.0.0
% License: GNU General Public License v3.0

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License.

% This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.

arguments
    Input = 'Insert Image Directory Here';
    CN = ClusterNumber; %Specify the Cluster Number Here
end
%% Insert the image dataset
imds = imageDatastore(Input,'IncludeSubfolders',true,'LabelSource','foldernames');
numberofimages = length(imds.Files);
Labels = cellstr(filenames2labels(Input));
%% Preporcessing & Resizing & Feature Extraction
% Convert the images into 2D(Grayscale)
CS =4; %Cell Size for HOG
for i = 1:numberofimages

    inputFileName = imread(imds.Files{i}); %read each image
    [rows, columns, numberOfColorChannels] = size(inputFileName);
   
if numberOfColorChannels == 3
    grayImage = rgb2gray(inputFileName);
end

[r, c, ~] = size(grayImage);
if r>c
grayImageSize = imresize(grayImage, 512 / r);
elseif c>r
grayImageSize = imresize(grayImage, 512 / c);
else
grayImageSize = imresize(grayImage, [512, 512] );
end

[featureVector{i},hogVisualization] = extractHOGFeatures(grayImageSize,'CellSize',[CS CS]);

A{i} = featureVector{i}';
end
%% Clustering
B=cell2mat(A); % Convert A from cell to matrix
C = pdist(B',"cosine"); % Cosine distance between the data points
Y = squareform(C);
Z=linkage(Y,'complete');
Clusters = cluster(Z,'maxclust',CN);    %Hierarchical Clustering
%% Plot dendrogram
figure(1)
cutoff =median([Z(end-(CN-1),3) Z(end-(CN-2),3)]); % set cut-off line location just change the number of clusters (a in line 36)
d =dendrogram(Z,0,'Labels',Labels,'ColorThreshold',cutoff);
yline(cutoff,'--','Cut-off Line','FontSize',14,'FontName','times','LineWidth',2); %show cutoff line in dendrogram
xlabel('Data Points');
ylabel('Similarity');
%% Export an MS Excel file that shows cluster number for each image
T =table(Labels,Clusters);
writetable(T,'HICA_Clusters.xlsx'); % The MS Excel file will be saved at the same location as Matlab function "HICA"
%% Show resulted clusters up to 5 clusters (depends on what is specified as "CN" as an argument)
if CN == 2
for j= 1:numberofimages
    if T.Clusters(j) == 1
        clust1{j} = j;
    clust1a =cell2mat(clust1);
    numberofimages2show = length(clust1a);
    figure(2)
    imshow(imtile(imds.Files(clust1a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 1');
    end
    if T.Clusters(j) == 2
        clust2{j} = j;
    clust2a =cell2mat(clust2);
    numberofimages2show = length(clust2a);
    figure(3)
    imshow(imtile(imds.Files(clust2a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 2');
    end
end
elseif CN == 3
for j= 1:numberofimages
    if T.Clusters(j) == 1
        clust1{j} = j;
    clust1a =cell2mat(clust1);
    numberofimages2show = length(clust1a);
    figure(2)
    imshow(imtile(imds.Files(clust1a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 1');
    end
    if T.Clusters(j) == 2
        clust2{j} = j;
    clust2a =cell2mat(clust2);
    numberofimages2show = length(clust2a);
    figure(3)
    imshow(imtile(imds.Files(clust2a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 2');
    end
    if T.Clusters(j) == 3
    clust3{j} = j;
    clust3a =cell2mat(clust3);
    numberofimages2show = length(clust3a);
    figure(4)
    imshow(imtile(imds.Files(clust3a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 3');
    end
end
elseif CN == 4
for j= 1:numberofimages
    if T.Clusters(j) == 1
        clust1{j} = j;
    clust1a =cell2mat(clust1);
    numberofimages2show = length(clust1a);
    figure(2)
    imshow(imtile(imds.Files(clust1a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 1');
    end
    if T.Clusters(j) == 2
        clust2{j} = j;
    clust2a =cell2mat(clust2);
    numberofimages2show = length(clust2a);
    figure(3)
    imshow(imtile(imds.Files(clust2a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 2');
    end
    if T.Clusters(j) == 3
    clust3{j} = j;
    clust3a =cell2mat(clust3);
    numberofimages2show = length(clust3a);
    figure(4)
    imshow(imtile(imds.Files(clust3a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 3');
    end
    if T.Clusters(j) == 4
    clust4{j} = j;
    clust4a =cell2mat(clust4);
    numberofimages2show = length(clust4a);
    figure(5)
    imshow(imtile(imds.Files(clust4a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 4');
    end
end
elseif CN == 5
for j= 1:numberofimages
    if T.Clusters(j) == 1
        clust1{j} = j;
    clust1a =cell2mat(clust1);
    numberofimages2show = length(clust1a);
    figure(2)
    imshow(imtile(imds.Files(clust1a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 1');
    end
    if T.Clusters(j) == 2
        clust2{j} = j;
    clust2a =cell2mat(clust2);
    numberofimages2show = length(clust2a);
    figure(3)
    imshow(imtile(imds.Files(clust2a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 2');
    end
    if T.Clusters(j) == 3
    clust3{j} = j;
    clust3a =cell2mat(clust3);
    numberofimages2show = length(clust3a);
    figure(4)
    imshow(imtile(imds.Files(clust3a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 3');
    end
    if T.Clusters(j) == 4
    clust4{j} = j;
    clust4a =cell2mat(clust4);
    numberofimages2show = length(clust4a);
    figure(5)
    imshow(imtile(imds.Files(clust4a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 4');
    end
    if T.Clusters(j) == 5
    clust5{j} = j;
    clust5a =cell2mat(clust5);
    numberofimages2show = length(clust5a);
    figure(6)
    imshow(imtile(imds.Files(clust5a),'GridSize',[15 15],'ThumbnailSize',[100 100]))
    title('Cluster 5');
    end
end    
end
end
