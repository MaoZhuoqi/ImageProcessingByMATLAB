# ImageProcessingByMATLAB

# MATLAB图像处理作业

## 内容

1.使用浏览器下载一张彩色图片（png格式）

2.使用MATLAB读取这张彩色图片，并显示在figure1

3.将此图片转为黑白图，并显示在figure2

4.将此图片缩小1倍，如500*500缩小为250*250，并显示在figure3

5.将缩小的图片用jpeg格式保存在本地硬盘

## 完整代码

```matlab
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
```



## 运行结果

```matlab
pic1 = imread('pic460x460.png');%从文件读取图像
figure,imshow(pic1);%将图像显示在figure1
```



![pic460x460](C:\Users\毛卓淇\OneDrive - hdu.edu.cn\桌面\files\matlab\MATLAB_EE\second_class\pic460x460.png)

```matlab
pic2 = pic2gray(pic1);%调用pic2gray函数，将图像转换为灰度图
figure,imshow(pic2);%将灰度图显示在figure2
```



![picgray](C:\Users\毛卓淇\OneDrive - hdu.edu.cn\桌面\files\matlab\MATLAB_EE\second_class\picgray.png)

```matlab
pic3 = picnarrow(pic1);%调用picnarrow函数，将原图像缩小至原来的一半
figure,imshow(pic3);%将缩小后的图像显示在figure3
imwrite(pic3,'pic230x230.jpeg');%以jpeg格式将缩小图保存
```



![pic230x230](C:\Users\毛卓淇\OneDrive - hdu.edu.cn\桌面\files\matlab\MATLAB_EE\second_class\pic230x230.jpeg)

## 其他

`pic2gray` 函数通过计算 R、G 和 B 分量的加权和，将 RGB 值转换为灰度值：

```matlab
0.2989 * R + 0.5870 * G + 0.1140 * B 
```

`picnarrow`函数可以通过修改`xscale`和`yscale`的值来改变图像缩小的比例