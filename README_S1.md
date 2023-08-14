# Ice_cover_detection using S1

This code helps to detect Ice cover using CFAR method
This code appears to perform ice edge detection on Sentinel-1 (S1) radar imagery using a filter-based approach. 
It begins by loading S1 data and setting a window size for filtering. 
The code calculates a "rho matrix" by convolving two radar channels (Img_HH and Img_HV) with a sliding window filter. 
It then processes the rho matrix to create a binary ice mask using statistical methods. 
The ice edge is further quantified using the Canny edge detection algorithm. 
The final output displays the original image with detected ice edges highlighted and labeled.

# Ice_cover_detection using S2
This code appears to perform ice edge detection on Sentinel-2 (S2) optical imagery using a circular filter-based approach.
It begins by loading S2 data and defining a circular filter with a specified radius. 
The code then applies circular cell averaging to smooth the image.
The resulting image is normalized and converted to a binary image using a threshold of 0.5. 
The Sobel edge detection algorithm is employed to find edges in the binary image. 
The code then identifies a specific region of interest and quantifies the detected edges within that region. 
Finally, the original image is displayed with detected ice edges highlighted and labeled.
