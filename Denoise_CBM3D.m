function [DenoisedBlocksSrgb, TimeMP] = ...
    DenoiseSrgb(Denoiser, siddDataDir)
imageFiles = dir(siddDataDir);
imageFiles = imageFiles(3:end);
nImages = numel(imageFiles);

    for i = 1 : nImages

        str_prts = strsplit(imageFiles(i).name, '_');
        id = char(str_prts(1));

        % load noisy raw-RGB image i
        imName = imread(fullfile(siddDataDir, imageFiles(i).name, [id, '_NOISY_SRGB_010.PNG'])); %READ IMAGE
        noisyImage = im2double(imName); %change type to double
        [PSNR, yRGB_est] = CBM3D(1, noisyImage, 25);
        
    end 
end 