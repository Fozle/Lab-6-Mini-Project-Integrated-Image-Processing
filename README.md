# Lab 6 – Mini Project: Image Processing Pipeline

## Objective

The objective of this project was to combine different image-processing techniques into one MATLAB pipeline. The pipeline includes noise removal, contrast enhancement, edge detection and frequency-domain filtering.

## 1. Image Selection

I used an image as the input for the processing pipeline. The image was converted into grayscale and double format before processing.

## 2. Noise Removal

I applied a 3x3 median filter using `medfilt2()`. This filter reduces noise while preserving important image details.

## 3. Contrast Enhancement

I used `imadjust()` to improve image contrast. This makes some image details easier to see.

## 4. Edge Detection

I used the Canny edge detector to identify important boundaries in the enhanced image.

## 5. Frequency-Domain Filtering

I used `fft2()` and `fftshift()` to convert the image into the frequency domain. An ideal low-pass filter removed high-frequency components. Finally, `ifft2()` converted the result back into an image.

## 6. Results and Discussion

The pipeline combines several image-processing operations. Median filtering reduces noise, contrast enhancement improves visibility, and Canny detects edges.

The low-pass filter reduces high-frequency information and produces a smoother image. However, it can also remove some fine details.

One limitation is that the ideal low-pass filter can produce ringing effects around sharp edges.

## Conclusion

This project demonstrated how spatial and frequency-domain operations can be combined in one image-processing pipeline. Each stage has a different purpose and contributes to the final result.

## AI Usage

**Tool used:** ChatGPT

**How I used it:** I used ChatGPT to understand MATLAB image-processing functions and prepare the pipeline code.

**What I verified or changed:** I ran the MATLAB script and checked the generated figures and command window output.
