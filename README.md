# Implementation-of-Video-Compression-H.264
Implementation of video encoder/decoder using MATLAB

My Project of the Information Theory and Coding Course Offered in Fall 2022 @ Zewail City.

In this project, I implemented a GUI to help users quantize an analog discrete signal using PCM QUANTIZATION.

![image](https://user-images.githubusercontent.com/58476343/220144783-623eecd8-2968-4a72-b59c-213ab13bbc37.png)




Part 1) Low Compression

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





## Demo <a name="demo"></a>

https://user-images.githubusercontent.com/58476343/220145051-93e3127b-baff-4de0-bd72-3e41a881d7e1.mp4
