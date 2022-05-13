function[denoisedImage] = HECorrect(noisyImage)
    hsv1 = rgb2hsv(noisyImage);


    v1 = hsv1(:,:,3);

    
    v1 = histeq(v1);


    hsv1(:,:,3) = v1;

    denoisedImage = hsv2rgb(hsv1);

end
