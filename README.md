# Introduction

This is a collection of scripts and pipeline configuration files serving as example for submitting automated Veracode scans in different CI tools. 

# Good to know 

- Veracode makes use of API credentials and secure tokens to authenticate with the platform and submit scans. There are two types of user - Human and API service accounts. API Service Account IDs and Keys should be used in pipelines. [Further info is available here](https://docs.veracode.com/r/c_about_veracode_accounts).

- Our [Document Center landing page](https://docs.veracode.com/) – authoritative resource for viewing step-by-step instructions & coverage for scan type

- Our [packaging requirements for apps](https://docs.veracode.com/r/compilation_packaging) – it is critical that this is adhered to in your build step/config prior to prior to uploading the compiled or packaged artifact(s) to Veracode for scanning. There is an abridged packaging cheat sheet [available here](https://nhinv11.github.io/#/).

- [Supported languages and platforms](https://docs.veracode.com/r/r_supported_table) – showing our full language coverage for SAST Sandbox/Policy Scans. Please note, at present the Pipeline Scan language coverage is reduced, but should achieve parity with Upload and Scan by end 2023 - [see current list here](https://docs.veracode.com/r/About_Pipeline_Scan_Prerequisites).

- SAST scans can be conducted using a variety of methods - using our API wrappers, Docker images or CI specific plugins/actions/tasks. See 'Methods of Scanning' for more info.

# Scan types included in these files

- Veracode Pipeline Scan SAST - Our fastest SAST scan type in CI, suited for use in pipelines/branches with frequent commits. Will show results in CI build log and generate a results.json file, but results are not visible in application profiles on platform. Use case is developers fixing findings earlier in their SSDLC.

- Veracode Upload and Scan SAST, SCA - Fully-feature SAST scan type, also includes basic SCA results with full visibility of results on Veracode web interface in application profiles. Suited for less frequent commits, as only one scan can be conducted at once in the Policy or in a Sandbox. Scans cannot be queued. 

- Veracode Agent-based SCA - For more in-depth SCA results, this scans a repo and provides enhanced information on vulnerabilities, vulnerable methods called by your code, license information and direct/transitive dependencies. Results are visible both in build log and in web user interace.

# Methods of scanning

Manual - Use web interface to submit Upload and Scan SAST, SCA and DAST scans.
API wrapper - 
Actions, Tasks, Plugins - available on respective marketplaces for each of the CI tools. These 




