function [DenoisedBlocksSrgb, TimeMP] = Denoise_CBM3D(Denoiser, siddDataDir)

% DENOISESRGB Deanoises SIDD benchmark images in sRGB space using some
% Denoiser.

% Denoiser: a function handle to the denoiser to be evaluated on the SIDD
% Benchmark

% DenoisedBlocksSrgb: the denoised blocks from sRGB images.

% siddDataDir: the directory containing the SIDD Benchmark images

% -------------------------------------------------------------------------
% Author: Abdelrahman Abdelhamed, York University
% kamel@eecs.yorku.ca
% https://www.eecs.yorku.ca/~kamel/
% -------------------------------------------------------------------------
% Reference: Abdelrahman Abdelhamed, Lin S., Brown M. S. 
% "A High-Quality Denoising Dataset for Smartphone Cameras", 
% IEEE Computer Vision and Pattern Recognition (CVPR'18), June 2018.
% -------------------------------------------------------------------------

% list of all image directories (there should be 40 of them)
load(siddDataDir, "-mat", 'ValidationNoisyBlocksSrgb'); 
a = size(ValidationNoisyBlocksSrgb); 

nImages = a(1); nBlocks = a(2); 

% block positions
tmp = load('D:\SIDD\SIDD_Benchmark_Code_v1.2\BenchmarkBlocks32.mat'); 
BenchmarkBlocks32 = tmp.BenchmarkBlocks32;

DenoisedBlocksSrgb = cell(nImages, nBlocks);
TimeMP = 0; % denoising time (in seconds) per megapixel

% for each image
for i = 1 : nImages
    % for each block
    for b = 1 : nBlocks
        fprintf('Denoising sRGB image %02d, block %02d ... ', i, b);
        noisyBlock = squeeze(ValidationNoisyBlocksSrgb(i,b,:,:,:)); 
        bi = BenchmarkBlocks32(b, :);
        % denoise 3 RGB channels simultaneously
        t0 = tic; % start timer
        [~,denoisedBlock]= Denoiser(1, noisyBlock, 25);
        t1 = toc(t0); % stop timer
        DenoisedBlocksSrgb{i, b} = single(denoisedBlock); %add to cell array of denoised blocks 
        
        % total time
        TimeMP = TimeMP + t1;
        fprintf('Time = %f seconds\n', t1); %something about time elapsed
    end
end

    TimeMP = TimeMP * 1024 * 1024 / ...
    (nImages * nBlocks * bi(3) * bi(4)); % seconds per megapixel
end 
