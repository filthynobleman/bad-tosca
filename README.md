# BadTosca
This repository contains the code generation for the BadTosca dataset presented in *ReMatching: Low-Resolution Representations for Scalable Shape Correspondence*.  
- DOI: https://arxiv.org/abs/2305.09274
- PDF: https://arxiv.org/abs/2305.09274

## Instructions
For generating the dataset, the original TOSCA dataset is required, and it needs to be converted in OFF format.  
Copy all the meshes inside the folder `TOSCA-dataset/offs` and run the MATLAB script `generate_dataset.m`.  
The output shapes can be found in the folder `BadTOSCA-dataset/offs`.  
The folder `BadTOSCA-dataset/regs` contains the registration of the remeshed shapes onto their original counterparts. Each registration contains the matrix `V` of the original vertices and the matrix `Pi` containing the barycentric coordinates representation of the new vertices in function of the original vertices. Namely, the matrix `Pi * V` contains the coordinates of the remeshed vertices.
