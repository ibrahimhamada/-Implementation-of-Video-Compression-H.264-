# Implementation-of-Video-Compression-H.264
Implementation of video encoder/decoder using MATLAB

My Project of the Information Theory and Coding Course Offered in Fall 2022 @ Zewail City.

In this project, I implemented the H.264 Video Compression (Both Encoder and Decoder) using 2 different Quantization Tables (High and Low Tables).


## Compression Steps:

A) Video Encoder 

            1) Reading the video and specifiying the I and P frames. 
            2) JPEG Encoding of the I-frame. 
                 a. Reading the image and check that it can be divided to an integer number of 8x8 blocks 
                 b. Divide the image into 8x8 Blocks on which DCT is applied 
                 c. DCT 8x8 Blocks are divided by a Low Quantization Table 
                 d. 8x8 Blocks are converted to 1-D vector (1x64) in a Serpentine pattern. 
                 e. Run Length Code is applied on the 1-D vectors 
                 f. Huffman Ecoding is applied on the Run Length Encoded Vectors
            3) Motion Estimation of the P-frames.  
            4) Motion Compensation of the P-frames.  
            5) JPEG Encoding of the P-frames.   
            6) Entropy Coding of the bitstream and the motion vectors.  
            7) Compression Ratio is Calculated.  

B) Video Decoder 

            1) JPEG Decoding of the I-frame. 
                 a. Huffman Decoding is applied on the recieved vector   
                 b. Run Length Decoding is applied on the restored symbols 
                 c. Decoded Vector is divided into (1x64) blocks and then each bloch is converted to 2D 
                 d. Each 8x8 Block is multiplied by the Low Quantization Table 
                 e. IDCT is applied on the 8x8 Blocks 
                 f. Combine 8x8 pixel groups into a single image and construct the frame.
            2) Entropy Decoding of the motion vectors of macro blocks. 
            3) Reconstruct the macro blocks to produce the decoded frames. 





## Original Video <a name="Original Video"></a>
https://user-images.githubusercontent.com/58476343/220159892-4a4bb33d-9f9b-4cda-8395-4e1939bfb918.mp4

## LOW Compression Video <a name="LOW Compression Video"></a>
https://user-images.githubusercontent.com/58476343/220160012-0b31f0de-c278-443d-9cc0-aa5202b60def.mp4

## HIGH Compression Video <a name="HIGH Compression Video"></a>
https://user-images.githubusercontent.com/58476343/220160074-7c0bb5df-cd9f-46c6-8ec2-78530db7aad6.mp4
