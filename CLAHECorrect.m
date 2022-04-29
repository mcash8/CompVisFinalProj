function [denoisedImage] = CLAHECorrect(noisyImage)
    
    LAB = rgb2lab(noisyImage);
    L = LAB(:,:,1)/100;
    L = adapthisteq(L); 
    LAB(:,:,1) = L*100;
    denoisedImage = lab2rgb(LAB); 

end
