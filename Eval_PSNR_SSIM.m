%baseline results DIR 
SiddDataDir = 'C:\Users\mcash8\Downloads\SIDD_Benchmark_Code_v1.1\SIDD_Benchmark_Code_v1.1\SIDD_Benchmark_Data\SIDD_Benchmark_Data'; 
baseline_dir = fullfile(SiddDataDir, '..', 'Submit');
%methods = {'gamma', 'clahe', 'histogramequalization', 'cbm3d'}; 

methods = {'gamma'};
nImages = 40; 

%need ground truth images 


for method = methods
     Method = string(method); 
     baseline_file = strcat(Method, '.mat'); 
     
     %load .mat file -- results are in DenoisedBlocksSrgb variable
     %DenoisedBlockSrgb: 40x32 rows = benchmark images columns = patch 
     cd(baseline_dir)
     load(baseline_file);         
     
     % block positions
    tmp = load(fullfile('BenchmarkBlocks32.mat')); 
    BenchmarkBlocks32 = tmp.BenchmarkBlocks32;
    nBlocks = size(BenchmarkBlocks32, 1);
    
    for i = 1:nImages
        for b = 1 : nBlocks 
            
        end 
    end 
    
end 
