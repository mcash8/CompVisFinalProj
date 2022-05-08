%ground truth results
gt_dir = ('D:\SIDD\ValidationGtBlocksSrgb'); 
load(gt_dir, "-mat", 'ValidationGtBlocksSrgb'); 

%baseline results DIR 
baseline_dir = 'D:\SIDD\Results\'; 

methods = {'gamma', 'clahe', 'histogramequalization'}; 

nImages = 40; 
nBlocks = 32;
PSNRs = cell(nImages, nBlocks); %used in for loop

% avg_psnr  = zeros(4, 40); 
% j=1;
% for method = methods
%      Method = string(method); 
%      baseline_file = strcat(Method, '.mat'); 
%      
%      %load .mat file -- results are in DenoisedBlocksSrgb variable
%      %DenoisedBlockSrgb: 40x32 rows = benchmark images columns = patch 
%      cd(baseline_dir)
%      load(baseline_file);         
%     for i = 1:nImages
%         for b = 1 : nBlocks 
% 
%             fprintf('Calculating PSNR on sRGB image %02d, block %02d ... \n ', i, b);
% 
%             gt = double(squeeze(ValidationGtBlocksSrgb(i,b,:,:,:)));
%             denoised = double(DenoisedBlocksSrgb{i,b}); 
% 
%             %calc PSNR
%             PSNRs{i,b} = psnr(denoised, gt); 
%         end 
%         avg_psnr(j,i) = mean([PSNRs{i,:}]); %avg psnr for current image
%         
%     end 
% 
%     j = j+1;  %update counter for methods
% 
%     fprintf('done!\n')
% end 
% 
% %save results 
% filename = 'psnr_results.mat'; 
% 
% save(filename, "avg_psnr"); 

%calculating mean SSIM

avg_ssim = zeros(4,40); 
j=1; 
SSIMs = cell(nImages, nBlocks);

for method = methods
     Method = string(method); 
     baseline_file = strcat(Method, '.mat'); 
     
     %load .mat file -- results are in DenoisedBlocksSrgb variable
     %DenoisedBlockSrgb: 40x32 rows = benchmark images columns = patch 
     cd(baseline_dir)
     load(baseline_file);         
    for i = 1:nImages
        for b = 1 : nBlocks 

            fprintf('Calculating SSIM on sRGB image %02d, block %02d ... \n ', i, b);

            gt = double(squeeze(ValidationGtBlocksSrgb(i,b,:,:,:)));
            denoised = double(DenoisedBlocksSrgb{i,b}); 

            %calc SSIM

             rSSIM = ssim(denoised(:,:,1), gt(:,:,1)); 
             gSSIM = ssim(denoised(:,:,2), gt(:,:,2)); 
             bSSIM = ssim(denoised(:,:,3), gt(:,:,3)); 
      
             SSIMs{i,b} = mean([rSSIM, gSSIM, bSSIM]); 
        end 
        avg_ssim(j,i) = mean([SSIMs{i,:}]); %avg psnr for current image
        
    end 

    j = j+1;  %update counter for methods

    fprintf('done!\n')
 
end 

%save results 
filename = 'ssim_results.mat'; 

save(filename, "avg_ssim"); 
