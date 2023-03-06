# Introduction

This is a collection of scripts and pipeline configuration files for use in different CI tools, for conducting automated Veracode security scanning. Veracode makes use of API credentials and secure tokens to authenticate and submit scans.

# Scan types included in these files

- Veracode Pipeline Scan SAST - Faster SAST scan type, suited for use in pipelines/branches with frequent commits. Requires packaging guidance is followed per Veracode documentation: https://docs.veracode.com/r/compilation_packaging
- Veracode Agent-based SCA
- Veracode Upload and Scan SAST, SCA


# Methods of scanning
Manual - Use web interface to submit Upload and Scan SAST, SCA and DAST scans.
API wrapper - 
Actions, Tasks, Plugins - available on respective marketplaces for each of the CI tools. These 

# General information
- Our Document Center landing page – extremely useful resource for viewing step-by-step instructions & coverage for scan type
- Our packaging requirements for apps – it is critical that this is adhered to in your build config, prior to uploading the artifact(s) to the Veracode platform. The cheat sheet for packaging I showed you is available here.
- Supported languages and platforms – showing our full language coverage for SAST Sandbox/Policy Scans. Please note, at present the Pipeline Scan language coverage is reduced, available here.


