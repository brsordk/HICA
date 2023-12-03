# **User's Guide**

## HICA: A MATLAB-based Hierarchical Image Clustering Algorithm for Classifying Parts Suitable for Additive and Traditional Manufacturing Technologies

### Brief Description of HICA
HICA is a software tool developed in MATLAB, specifically designed to differentiate parts suitable for additive and traditional manufacturing technologies based on part geometry only. The software tool can classify image datasets, CAD datasets, and combined datasets with both images and CAD models. The tool can reduce time and effort spent for selectin a manufacturing process by providing a preselected set of parts that are more suitable for additive manufacturing. The software is aimed to support decision making for traditional manufacturing companies that consider expanding their production capabilities by introducing additive manufacturing processes to their production portfolio.
### System Requirements
HICA is developed using a CAD software and MATLAB R2022b; hence, system requirements are identical to those required for MATLAB. The following toolboxes should be installed before running the HICA:
-	Statistics and Machine Learning Toolbox
-	Computer Vision Toolbox 
-	Image Processing Toolbox

It is recommended to install the newest version of MATLAB software.

In case of using CAD models as inputs, the HICA requires a CAD processing software with the following properties:

-	The CAD tool is able to export images of CAD models automatically (e.g., SolidWorks Task Scheduler)
-	The default template of the CAD tool is set to have no shadow and no background graphics.

### Instructions to Run the Software
**Step 1:** Ensure you have the newest version of MATLAB and a CAD software are installed on your computer. Install the aforementioned toolboxes as MATLAB add-ins. Then, use the CAD software you have installed in your computer to extract images from CAD models. Below you can find the steps to export images using SOLIDWORKS Task Scheduler, but you can use another CAD software to acquire the images.
