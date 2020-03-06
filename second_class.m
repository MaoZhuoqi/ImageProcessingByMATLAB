pic1 = imread('pic460x460.png');%���ļ���ȡͼ��
figure,imshow(pic1);%��ͼ����ʾ��figure1
pic2 = pic2gray(pic1);%����pic2gray��������ͼ��ת��Ϊ�Ҷ�ͼ
figure,imshow(pic2);%���Ҷ�ͼ��ʾ��figure2
pic3 = picnarrow(pic1);%����picnarrow��������ԭͼ����С��ԭ����һ��
figure,imshow(pic3);%����С���ͼ����ʾ��figure3
imwrite(pic3,'pic230x230.jpeg');%��jpeg��ʽ����Сͼ����

function picgray = pic2gray(imrgb)%����pic2gray���������ڽ�ͼ��ת��Ϊ�Ҷ�ͼ
    [m,n,t] = size(imrgb);%��ȡͼƬ�Ĵ�С
    for i = 1:m
        for j = 1:n
            for k = 1:t
            picgray(i,j,k) = 0.299*imrgb(i,j,1)+0.587*imrgb(i,j,2)+0.11400*imrgb(i,j,3);%��Ȩʵ�ִ���ʵ��ҶȵĽ�άת��
            end
        end
    end
end

function picresize = picnarrow(imrgb)%����picnarrow���������ڽ�ͼ���������
    [h,w,t] = size(imrgb);%��ȡͼ���С
    xscale = 2;%�����С2��
    yscale = 2;%�߶���С2��
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