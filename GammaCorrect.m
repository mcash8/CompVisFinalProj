function [denoisedImage] = GammaCorrect(noisyImage)
%apply gamma correction: https://www.mathworks.com/help/images/gamma-correction.html
    gamma = 0.3; 
    denoisedImage = imadjust(noisyImage, [], [], gamma); 
end