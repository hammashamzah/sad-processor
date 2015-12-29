%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Template Matching
%
%PART1?FGray scaling&Binarization
%PART2?FMatching process for SAD(Sum of Absolute Difference)
%PART3?FDrawing matching point
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Initialization
clear all;
%Matching Threshold?FRegarded as being matched being matched if SAD is smaller than "thres"
thres=500;

%input image data
imagedata=imread('original.png');        %original image
tmpdata=imread('template.png');          %template image_binary

%size of image data
%imagesize(1) stands for height of imagedata, and imagesize(2) stands for width of imagedata
imagesize=size(imagedata); 
tmpsize=size(tmpdata);

%Output of MATLAB console
X=fprintf('SAD threshold is %d\n',thres);
X=fprintf('Original image size is %dx%d\n',imagesize(2),imagesize(1));
X=fprintf('Template image size is %dx%d\n',tmpsize(2),tmpsize(1));


%--------------------------------------------------------------------------

%PART1?FGray scaling&Binarization

disp('Part1')
tic;

%Matrix of storing histogram
histgram=zeros(1,256);

%Decision of Binarization Threshold

for height = 1 : imagesize(1)
    for width = 1 : imagesize(2)
        %Ttansformation from 3D Matrix to 2D Matrix(Gray scaling)
        imagedata_gray(height,width) = floor(0.2989*imagedata(height,width,1)+0.5870*imagedata(height,width,2)+0.1140*imagedata(height,width,3));
        %histogram of original image
        %histgram(imagedata_gray(height,width)+1)=histgram(imagedata_gray(height,width)+1)+1;
    end
end

% i=1;
% hist_freq=0;
% while(hist_freq<imagesize(1)*imagesize(2)/2)
    % hist_freq=hist_freq+histgram(i);
    % i=i+1;
% end
% binarize_thres=i;
binarize_thres = 107;

%Creating Lookup table
for i = 1 : 256
    if(binarize_thres<i)
        LUT(i)=1;
    else
        LUT(i)=0;
    end
end


%Original image
for height = 1 : imagesize(1)
    for width = 1 : imagesize(2)
        %Grayscaling(NTSC Coef. method)
        outpixel = floor(0.2989*imagedata(height,width,1)+0.5870*imagedata(height,width,2)+0.1140*imagedata(height,width,3));
        %Binarization
        image_binary(height,width)=LUT(outpixel+1);
    end         
end

%Template image
for height = 1 : tmpsize(1)
    for width = 1 : tmpsize(2)
        %Grayscaling(NTSC Coef. method)
        outpixel = floor(0.2989*tmpdata(height,width,1)+0.5870*tmpdata(height,width,2)+0.1140*tmpdata(height,width,3));
        %Binarization
        tmp_binary(height,width)=LUT(outpixel+1);
    end         
end

sad=zeros(imagesize(1)-tmpsize(1)+1,imagesize(2)-tmpsize(2)+1);
toc;

%--------------------------------------------------------------------------
%PART2?FMatching process for SAD
disp('Part2')
tic;

for image_height=1:imagesize(1)-tmpsize(1)+1
    for  image_width = 1:imagesize(2)-tmpsize(2)+1        
        for tmp_height = 1 : tmpsize(1)
            for tmp_width = 1 : tmpsize(2)
       %If value of original image and template are different, increments the value of A
                if xor(tmp_binary(tmp_height,tmp_width),image_binary(tmp_height+image_height-1,tmp_width+image_width-1)) == 1
                    sad(image_height,image_width)=sad(image_height,image_width)+1;
                end
            end
        end
    end
end
toc;

%--------------------------------------------------------------------------
%PART3?FDrawing matching point

disp('Part3')
tic;

sad_pos = zeros(2,(imagesize(1)-tmpsize(1)+1)*(imagesize(2)-tmpsize(2)+1));
index = 1;
sadsize=size(sad);
for sad_height = 1 : sadsize(1)
    for sad_width = 1 : sadsize(2)
        %if SAD is smaller than thres, enclosing a red line
        if sad(sad_height,sad_width)<thres
            sad_pos(1,index) = sad_width;
            sad_pos(2,index) = sad_height;
            index = index + 1;
            
            for tmp_height=1:tmpsize(1)
            %left of frame border
            imagedata(sad_height+tmp_height-1,sad_width,:)=[255,0,0];
            %right of frame border
            imagedata(sad_height+tmp_height-1,sad_width+tmpsize(2),:)=[255,0,0];   
            end
            
             for tmp_width=1:tmpsize(2)
            %upper of frame border
            imagedata(sad_height,sad_width+tmp_width-1,:)=[255,0,0];
            %bottom of frame border
            imagedata(sad_height+tmpsize(1),sad_width+tmp_width-1,:)=[255,0,0];
            end
        end
    end
end

toc;

%Output image
imwrite(real(imagedata), 'image_result.png');