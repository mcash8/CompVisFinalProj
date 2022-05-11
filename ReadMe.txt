Project Title: Low Light Image Denoising 
Class: EE4780 - Computer Vision @ LSU

Description:
The goal of this project was to investigate the performance of neural networks (NN) vs. standard image denoising techniques. 

Dataset: 
We use the smartphone image denoising dataset to evaluate the NN performance. These are real scene instances taken on a variety of smartphones.
We used the small dataset that consists of 160 image pairs to train the NN (https://www.eecs.yorku.ca/~kamel/sidd/dataset.php). To evaluate the NN
we use the validation data and ground truth .mat files (https://www.eecs.yorku.ca/~kamel/sidd/benchmark.php). 

Evaluation:
We use PSNR and SSIM as evaluation metrics.

File Descriptions:
------Standard Image Denoising Techniques---------

HECorrect.m : runs histogram equalization on a single patch of an image
GammaCorrect.m: runs gamma correction on a single patch of an image
CLAHECorrect.m: runs contrastive loss histogram equalization on a single patch of an image
CBM3D.m: runs color block matching 3D on a single patch of an image
   |
   |---Dependencies:
   |---- bm3d_thr_color.mexw64
   |---- bm3d_wiender_color.mexw64

Demo_SIDD.M: Runs one of the four standard image denoising scripts 
   |
   |---Dependencies:
   |----SIDD_Denoise.m
   |-----DenoiseMat.m
   |-----Denoise_CBM3D.m

Eval_PSNR_SSIM.m: Calculates PSNR and SSIM on denoised blocks


How to run: 
1) Download validation data. There should be two .mat files (ValidationGtBlocksSrgb.mat & ValidationNoisyBlocksSrgb.mat). Make sure they are in 
your working path in matlab. Make sure the .mat file BenchmarkBlocks32.mat is in the same path
2) Open Demo_SIDD.m. Change line 18 to the path that contains the .mat file for the ValidationNoisyBlocks.mat
3) Open SIDD_Denoise.m. Change lines 50 and 58 to the same path as in step 2
4) Run Demo_SIDD.m. The command window will prompt you to enter a denoising method. 
5) The denoised blocks are stored in a .mat file in the Results Folder. 
6) Open Eval_PSNR_SSIM.m. Change line 2 adn 6 to the path that contains the .mat file with ValidationGtBlocksSrgb.mat and the Results folder.

Remarks: To see the denoised patches, use the imshow function. Load one of the .mat files from the results folder and type the command
imshow(DenoisedBlocksSrgb{i,b}) in the command window. i is the image number index (1-40), b is the image patch number (1-32). 

-------Neural Network---------
For real noise dataset, we use sRGB images from SIDD (https://www.eecs.yorku.ca/~kamel/sidd/dataset.php). 
Download the dataset and put the “Data” directory in a folder labeled “trainsets”. The validation data should be put in a folder labeled "testsets/sidd_small".  

Skip training process (it is lengthy) and load a pre-trained model by running Submit.py. Pretrained model .pth and support files are in models folder

main_train_DRNet_sidd.py: Run for training NN
Submit.py: Tests the NN trained on SIDD dataset. 
/models: folder with pretrianed model 
/utils: support files for training


Code credits: 
https://www.eecs.yorku.ca/~kamel/sidd/benchmark.php -- used benchmark code to automate 
https://github.com/glemaitre/BM3D/blob/master/CBM3D.m -- used for CBM3D.m and dependencies
https://github.com/JiaHongZ/DRNet -- used for training, testing and evaluating NN

