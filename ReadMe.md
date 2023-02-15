# PhD Thesis Supplementary Material

This repository aims at disseminating what could not be mentioned directly in my PhD thesis (*Facilitating Inertial Sensors-based Biomechanical Analysis: En Route from the Laboratory to the Real-life*).

In this repository you can find some of the procedures I used in my works in the form of codes. Most of the material here proposed is written in ```MATLAB``` synthax. It can supposedly be used through GNU Octave. However, some of the material is presented as either ```Jupyter Notebook``` or ```R``` code. The list is the following one:

### **Ankle Functional Calibration** - Codename ```FAN```
[![Made withMATLAB](https://img.shields.io/badge/Made%20with-MATLAB-red?style=for-the-badge&logo=data:./img/MATLAB_icon.png)](https://www.mathworks.com/)

<p align="center"><kbd><a href = "">
  <img width="640" src="/img/FAN_FIG.png" alt = ""> </a> </kbd>
</p>

  - This portion of supplementary material relates to the creation of an anatomical coordinate system for the ankle joint complex. It was chosen to use a functional approach and stress for its repeatability and reliability during straight walking bouts. 
  - Published in *A Functional Calibration Protocol for Ankle Plantar-Dorsiflexion Estimate using Magnetic and Inertial Measurement Units: Repeatability and Reliability Assessment*, Journal of Biomechanics. doi: [10.1016/j.jbiomech.2022.111202](https://doi.org/10.1016/j.jbiomech.2022.111202)

### **Foot Contacts**  - Codename ```ITW```
[![Made withMATLAB](https://img.shields.io/badge/Made%20with-MATLAB-red?style=for-the-badge&logo=data:./img/MATLAB_icon.png)](https://www.mathworks.com/)
<p align="center"><kbd><a href = "">
  <img width="640" src="/img/ITW_FIG.png" alt = ""> </a> </kbd>
</p>

- This portion of supplementary material relates to the identification of foot contacts in children with an idiopathic toe-walking pattern using a single foot-mounted IMU.

- Published in *Impact of Gait Events Identification through Wearable Inertial Sensors on Clinical Gait Analysis of Children with Idiopathic Toe Walking*, Micromachines. doi: [10.3390/mi14020277](https://doi.org/10.3390/mi14020277)

### **Permutation Feature Importance**  - Codename ```PFI``` 
[![Made withJupyter](https://img.shields.io/badge/Made%20with-Jupyter-orange?style=for-the-badge&logo=Jupyter)](https://jupyter.org/try)

  - This portion of the supplementary material relates to the determination of the importance of a feature into a dataset.
  - Published in *Machine learning aided jump height estimate democratization through smartphone measures*, Frontiers in Sports and Active Living. doi: [10.3389/fspor.2023.1112739](https://doi.org/10.3389/fspor.2023.1112739)
  
### **Bland-Altman Plot** - Codename ```BAP```
[![Made withR](https://img.shields.io/badge/Made%20with-R-blue?style=for-the-badge&logo=R)](https://cran.r-project.org/)

<p align="center"><kbd><a href = "">
  <img width="640" src="/img/BAP_FIG.png" alt = ""> </a> </kbd>
</p>

  - This portion of supplementary material is supposed to help understanding how to properly realize the Bland-Altman Plots.
  - Published in *Machine learning aided jump height estimate democratization through smartphone measures*, Frontiers in Sports and Active Living. doi: [10.3389/fspor.2023.1112739](https://doi.org/10.3389/fspor.2023.1112739)

## Data

Example data are provided in the ```data``` folder. 

All the data comes from real experiments and are supposed to be used for demonstration only. All data are provided as ```.csv``` files, with **dot-separated decimals**.

Each filename prefix refers to the project it shares the acronym with (e.g., ```FAN_FC.csv``` refers to the project involving functional calibration). 

## Otro 

The codes related to other *bigger* portions of the thesis are left to other different repositories, since they had to be made available for publishing purposes. Also in this case, coding is written either using ```MATLAB```, ```Python``` (Jupyter Notebook), or ```R```. In particular:

- [x] Smartphone Height Democratization is available at [height-democratization](https://github.com/Maskul93/height-democratization)
- [x] Mechanical Power Estimation is available at [Jump-Power-ML-IMU](https://github.com/Maskul93/Jump-Power-ML-IMU)
- [x] MIMUs Offline Calibration: [MIMU-calib-tutorial](https://github.com/Maskul93/MIMU-calib-tutorial)
