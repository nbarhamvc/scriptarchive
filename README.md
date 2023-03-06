# Introduction

This is an unofficial collection of scripts and pipeline configuration files that I use, serving as examples for submitting automated Veracode scans in different CI tools. 

# Good to know 

- Our [Document Center landing page](https://docs.veracode.com/) – is the authoritative resource for viewing step-by-step instructions & coverage for scan type.

- Veracode makes use of API credentials and secure tokens to authenticate with the platform and submit scans. There are two types of user - Human and API service accounts. API Service Account IDs and Keys should be used in pipelines. [Further info is available here](https://docs.veracode.com/r/c_about_veracode_accounts).

- Our [packaging requirements for apps](https://docs.veracode.com/r/compilation_packaging) – it is critical that this is adhered to in your build step/config prior to prior to uploading the compiled or packaged artifact(s) to Veracode for scanning. There is an abridged packaging cheat sheet [available here](https://nhinv11.github.io/#/).

- [Supported languages and platforms](https://docs.veracode.com/r/r_supported_table) – showing our full language coverage for SAST Sandbox/Policy Scans. Please note, at present the Pipeline Scan language coverage is reduced, [see current list here](https://docs.veracode.com/r/About_Pipeline_Scan_Prerequisites).

- Static Analysis (SAST) identifies potentially exploitable flaws in code you have written. SAST scans can be conducted using a variety of methods - see 'Methods of Scanning' for more info. 

- Software Composition Analysis (SCA) identifies known vulnerabilities for your open-source dependencies. Basic results are generated automatically when packaging and scanning your app for Upload and Scan SAST, with more in-depth results visible using Agent-based SCA (see below).

# Scan types included in these files

- [Veracode Pipeline Scan SAST](https://docs.veracode.com/r/Pipeline_Scan) - Our fastest SAST scan type in CI, suited for use in pipelines/branches with frequent commits. Will show results in CI build log and generate a results.json file, but results are not visible in application profiles on platform. Use case is developers fixing findings earlier in their SSDLC. 

- [Upload and Scan SAST, SCA](https://docs.veracode.com/r/Getting_Started_with_Static_Analysis) - Fully-feature SAST scan type, also includes basic SCA results with full visibility of results on Veracode web interface in application profiles. Suited for less frequent commits, as only one scan can be conducted at once in the Policy or in a Sandbox. Scans cannot be queued. 

- [Agent-based SCA](https://docs.veracode.com/r/Choosing_the_SCA_Scan_Type_for_Your_Use_Case) - For more in-depth SCA results, this scans a repo and provides enhanced information on vulnerabilities, vulnerable methods called by your code, license information and direct/transitive dependencies. Results are visible both in build log and in web user interace.

# Methods of submitting scans

There are a number of methods which can be used to submit scans, dependent on environment and preference. Although the methods are different, the result is the same. 

- Plugins, Actions, Tasks - dependent on CI tool, these abstract the wrappers from the user to make configuration easier. Search the relevant marketplace to see Veracode official artifacts.

- API wrappers - Our Java/C# wrappers can be used to submit scans from any command line/shell/bash environment, along with API querying/automation. [See this link for more information](https://docs.veracode.com/r/c_about_wrappers). Please be aware that some of the files/scripts in this repo will only work on either Linux or Windows environments.

- Docker images - containing our wrappers for use in CI pipelines. [See this link to the images](https://hub.docker.com/u/veracode).

- Manual - You can use the web interface to manually conduct all scan types, with the exception of Agent-based SCA.

# Example of how scan types could be integrated

The below figure shows an example of [i]potential[/i] use of scan types as part of branch structure. Entirely flexible based on your DevOps pattern/commit frequency:

