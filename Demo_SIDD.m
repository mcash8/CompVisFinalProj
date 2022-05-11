% Demonstration of using the SIDD Benchmark

% -------------------------------------------------------------------------
% Author: Abdelrahman Abdelhamed, York University
% kamel@eecs.yorku.ca
% https://www.eecs.yorku.ca/~kamel/
% -------------------------------------------------------------------------
% Reference: Abdelrahman Abdelhamed, Lin S., Brown M. S. 
% "A High-Quality Denoising Dataset for Smartphone Cameras", 
% IEEE Computer Vision and Pattern Recognition (CVPR'18), June 2018.
% -------------------------------------------------------------------------

% the directory containing the SIDD Benchmark images
% Note: change this line if the Data is not in the parent directory
% Note: SIDD_Benchmark_Data can be downloaded from: 
% https://www.eecs.yorku.ca/~kamel/sidd/benchmark.php
%SiddDataDir = 'C:\Users\mcash8\Downloads\SIDD_Benchmark_Code_v1.1\SIDD_Benchmark_Code_v1.1\SIDD_Benchmark_Data\SIDD_Benchmark_Data'; 
SiddDataDir = 'D:\SIDD\ValidationNoisyBlocksSrgb'; 

% path for a Gaussian noise estimatoin method
% Note: you may replace this mehtod with your favourite one
addpath 'NoiseEstimation_ICCV2015_code';

% Some optional, yet useful, data to include, feel free to put your data
%---ignore---
OptionalData.MethodName = 'DummyDenoiser';
OptionalData.Authors = 'Jane Doe and Jone Doa';
OptionalData.PaperTitle = 'Dummy Image Denoising';
OptionalData.Venue = 'SIDD Demo';
% Specs of the machine used to run the benchmark (useful for time
% comparison)
OptionalData.MachineSpecs = 'Intel Core i7 6700 @ 3.4 GHz, 32 GB RAM'; 
% Note: you may add more optional data as needed

% denoise Raw-RGB images
Method = input('Enter correction method\n', "s");
Method = strrep(lower(Method),' ','') ; 

OptionalData.SaveName = [Method,'.mat'];

switch Method
    case 'gamma'
        SIDD_Denoise(@GammaCorrect, SiddDataDir, 'srgb', OptionalData, Method);
    case 'clahe'
        SIDD_Denoise(@CLAHECorrect, SiddDataDir, 'srgb', OptionalData, Method);
    case 'histogramequalization'
        SIDD_Denoise(@HECorrect, SiddDataDir, 'srgb', OptionalData, Method);
    case 'cbm3d'
      SIDD_Denoise(@CBM3D, SiddDataDir, 'srgb', OptionalData, Method); 
        
end 
