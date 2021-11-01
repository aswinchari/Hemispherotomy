# Hemispherotomy: A connectomic and network perspective 

This repository contains the instructions & code to construct structural connectivity matrices and calculate network measures in the following manuscript:

*Anatomical and network changes to the connectome following peri-insular hemispherotomy: A connectomic approach* by Chari et al. 

# Image Processing

## Structural Imaging & Parcellation

The structural imaging (3T T1 MPRAGE sequences) were organised in [BIDS](https://bids.neuroimaging.io) format and fed through [Connectome Mapper 3](https://connectome-mapper-3.readthedocs.io/en/latest/). We chose the Lausanne Atlas at Scale 3 for this study. 

## Diffusion Imaging Preprocessing

Multi-shell multi-tissue diffusion imaging was preprocessed using standard preprocessing steps according to the script **diffusion_preproc.sh**. The multi-shell multi-tissue dicom files were stored in a folder called 'dwi' and the negative phase encoded series in a folder called 'negPE'. All tools were [mrtrix](https://mrtrix.readthedocs.io/en/latest/) in line with their recommended steps. 

## Constructing the Connectome

This was done by combining the parcellation scheme with the preprocessed diffusion imaging according to the script **make_connectome.sh**. Firstly the structural data was registered to diffusion space and the cortical target labels were amended according to **Scale3_NewLabels.txt**. For this, we fused the hippocampal subparcels into a single label, resulting in 253 cortical, subcortical and brainstem parcels per subject. The connectome used anatomically constrained tractography and the SIFT2 filtering step. The output is a 253x253 weighted, undirected structural connectivity matrix in .csv format.

## Simulating the Hemispherotomy

The simulated PIH steps were performed on an adolescent atlas brain, available through the [Open Science Framework page for this project](https://osf.io/68tmn/?view_only=f297d42574c24a4aaa16b5aa2d8b5187) under **SimulatedCuts.zip**. These were registered onto the individual subject brains and the diffusion was re-run exclusing the regions of interest for each cut from the streamlines, as per the script **hemispherotomy.sh**. The output connectomes are available either as csv files (**Output.zip**) or imported into a matlab structure (**hemispherotomy.mat**) at the [Open Science Framework page for this project](https://osf.io/68tmn/?view_only=f297d42574c24a4aaa16b5aa2d8b5187)

# Analysis

The extracted connectomes were assembled as structures and analysed in Matlab v2020b using the scripts provided. The Matlab scripts are ordered and the intermediate output files are also provided. Graphical figures were generated in Matlab. 

# Visualisation

The network visualisations require dowloading [SurfIce](https://www.nitrc.org/projects/surfice/) and exporting txt files of the structural connectivity matrices in the desired formats. For more information, please see the [SurfIce Wiki on viewing a connectome network map](https://www.nitrc.org/plugins/mwiki/index.php/surfice:MainPage#Loading_a_connectome_network_map). 
