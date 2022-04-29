function [denoisedImage] = HECorrect(noisyImage)

    denoisedImage = histeq(noisyImage); 

end
