function [] = SIDD_Denoise(Denoiser, SiddDataDir, RawOrSrgb, OptionalData, Method)

% SIDD_DENOISE Evaluates a Denoiser on the SIDD Benchmark

% Denoiser: a function handle to the denoiser to be evaluated on the SIDD
% Benchmark

% SiddDataDir: the directory containing the SIDD Benchmark images

% RawOrSrgb: indicated whether to denoise the raw-RGB or the sRGB images.
% Value: 'raw' or 'srgb'

% OptionalData: a struct containing optoinal text data to describe the 
% Denoiser, for example, denoiser's name, author's name, reference papaer, 
% etc.

% -------------------------------------------------------------------------
% Author: Abdelrahman Abdelhamed, York University
% kamel@eecs.yorku.ca
% https://www.eecs.yorku.ca/~kamel/
% -------------------------------------------------------------------------
% Reference: Abdelrahman Abdelhamed, Lin S., Brown M. S. 
% "A High-Quality Denoising Dataset for Smartphone Cameras", 
% IEEE Computer Vision and Pattern Recognition (CVPR'18), June 2018.
% -------------------------------------------------------------------------

% output directory to save the denoised blocks in either of two files 
% "SubmitRaw.mat" or "SubmitSrgb.mat"
% these files should be submitted for evaluation
submitDir = fullfile(SiddDataDir, '..', 'Results');
if ~exist(submitDir, 'dir'), mkdir(submitDir); end

% call DenoiseRaw or DenoiseSrgb to perform the denoising
% save the denoised blocks and optional data
switch RawOrSrgb
    
    case 'raw' %not necessary for our project
    
        [DenoisedBlocksRaw, TimeMPRaw] = DenoiseRaw(Denoiser, SiddDataDir);
        fprintf('Saving resutls...\n');
        save(fullfile(submitDir, 'SubmitRaw.mat'), 'DenoisedBlocksRaw', ...
            'TimeMPRaw', 'OptionalData', '-v7.3');
        fprintf('Done!\n');
        
    case 'srgb'
        if strcmp(Method, 'cbm3d')
                [DenoisedBlocksSrgb, TimeMPSrgb] = Denoise_CBM3D(Denoiser, SiddDataDir);
            fprintf('Saving resutls...\n');
    
            save(fullfile('D:\SIDD\Results\', OptionalData.SaveName), 'DenoisedBlocksSrgb', ...
                'TimeMPSrgb', 'OptionalData', '-v7.3');
            fprintf('Done!\n');

        else 
        [DenoisedBlocksSrgb, TimeMPSrgb] = DenoiseMat(Denoiser, SiddDataDir);
        fprintf('Saving resutls...\n');

        save(fullfile('D:\SIDD\Results\', OptionalData.SaveName), 'DenoisedBlocksSrgb', ...
            'TimeMPSrgb', 'OptionalData', '-v7.3');
        fprintf('Done!\n');
        end
       
    otherwise
        
        disp('Invalid RawOrSrgb value!');

end

end

