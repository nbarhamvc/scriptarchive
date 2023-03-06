# Introduction

This is a collection of scripts and pipeline configuration files serving as example for submitting automated Veracode scans in different CI tools. 

# Good to know 

- Veracode makes use of API credentials and secure tokens to authenticate with the platform and submit scans. There are two types of user - Human and API service accounts. API Service Account IDs and Keys should be used in pipelines. [Further info is available here](https://docs.veracode.com/r/c_about_veracode_accounts).

- Our [Document Center landing page](https://docs.veracode.com/) – authoritative resource for viewing step-by-step instructions & coverage for scan type

- Our [packaging requirements for apps](https://docs.veracode.com/r/compilation_packaging) – it is critical that this is adhered to in your build step/config prior to prior to uploading the compiled or packaged artifact(s) to Veracode for scanning. There is an abridged packaging cheat sheet [available here](https://nhinv11.github.io/#/).

- [Supported languages and platforms](https://docs.veracode.com/r/r_supported_table) – showing our full language coverage for SAST Sandbox/Policy Scans. Please note, at present the Pipeline Scan language coverage is reduced, but should achieve parity with Upload and Scan by end 2023 - [see current list here](https://docs.veracode.com/r/About_Pipeline_Scan_Prerequisites).

# Scan types included in these files

- Veracode Pipeline Scan SAST - Faster SAST scan type, suited for use in pipelines/branches with frequent commits. Will show results in build log and generated results.json file, but results not visible in application profiles on platform.

- Veracode Upload and Scan SAST, SCA - Full-feature SAST scan type, also includes basic SCA results. Suited for less frequent commits, but gives full visibility in Veracode platform application profile. Requires

- Veracode Agent-based SCA



# Methods of scanning
Manual - Use web interface to submit Upload and Scan SAST, SCA and DAST scans.
API wrapper - 
Actions, Tasks, Plugins - available on respective marketplaces for each of the CI tools. These 




