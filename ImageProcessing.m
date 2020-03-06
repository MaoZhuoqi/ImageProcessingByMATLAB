pic1 = imread('pic460x460.png');%从文件读取图像
figure,imshow(pic1);%将图像显示在figure1
pic2 = pic2gray(pic1);%调用pic2gray函数，将图像转换为灰度图
figure,imshow(pic2);%将灰度图显示在figure2
pic3 = picnarrow(pic1);%调用picnarrow函数，将原图像缩小至原来的一半
figure,imshow(pic3);%将缩小后的图像显示在figure3
imwrite(pic3,'pic230x230.jpeg');%以jpeg格式将缩小图保存

function picgray = pic2gray(imrgb)%定义pic2gray函数，用于将图像转换为灰度图
    [m,n,t] = size(imrgb);%读取图片的大小
    for i = 1:m
        for j = 1:n
            for k = 1:t
            picgray(i,j,k) = 0.299*imrgb(i,j,1)+0.587*imrgb(i,j,2)+0.11400*imrgb(i,j,3);%加权实现从真彩到灰度的降维转换
            end
        end
    end
end

function picresize = picnarrow(imrgb)%定义picnarrow函数，用于将图像进行缩放
    [h,w,t] = size(imrgb);%读取图像大小
    xscale = 2;%宽度缩小2倍
    yscale = 2;%高度缩小2倍
    ht = round(h./xscale);
    wt = round(w./yscale);
    for i = 1:ht
        for j = 1:wt
            for k = 1:t
                picresize(i,j,k) = imrgb(round(i*xscale),round(j*xscale),k); 
            end
        end
    end
end