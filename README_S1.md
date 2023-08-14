# Ice_cover_detection
This code helps to detect Ice cover using CFAR method
This code appears to perform ice edge detection on Sentinel-1 (S1) radar imagery using a filter-based approach. 
It begins by loading S1 data and setting a window size for filtering. 
The code calculates a "rho matrix" by convolving two radar channels (Img_HH and Img_HV) with a sliding window filter. 
It then processes the rho matrix to create a binary ice mask using statistical methods. 
The ice edge is further quantified using the Canny edge detection algorithm. 
The final output displays the original image with detected ice edges highlighted and labeled.
