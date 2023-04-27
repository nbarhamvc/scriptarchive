# Intro

This is an unofficial collection of scripts and pipeline configuration files that I use, serving as examples for submitting automated Veracode scans in different CI tools. 

# Good to know 

- Veracode's [Document Center landing page](https://docs.veracode.com/) is the authoritative resource for viewing step-by-step instructions & coverage for scan type. The [Glossary](https://docs.veracode.com/r/Veracode_Glossary) provides more information on terminology used here.

- Veracode makes use of API credentials and secure tokens to authenticate with the platform and submit scans. There are two types of user - Human and API service accounts. API Service Account IDs and Keys should be used in pipelines. [Further info is available here](https://docs.veracode.com/r/c_about_veracode_accounts).

- Veracode's [packaging requirements for apps](https://docs.veracode.com/r/compilation_packaging) – it is critical that this is adhered to in your build step/config  prior to uploading the compiled or packaged artifact(s) to Veracode for Static Analysis (SAST) scanning. There is an abridged packaging cheat sheet [available here](https://nhinv11.github.io/#/).

- [Supported languages and platforms](https://docs.veracode.com/r/r_supported_table) – showing full language coverage for SAST Sandbox/Policy Scans. Please note, at present the Pipeline Scan language coverage is reduced, [see current list here](https://docs.veracode.com/r/Pipeline_Scan_Supported_Languages).

- Static Analysis (SAST) identifies potentially exploitable flaws in code you have written. SAST scans can be conducted using a variety of methods - see 'Methods of submitting scans' below for more info. 

- Software Composition Analysis (SCA) identifies known vulnerabilities for your open-source dependencies. Basic results are generated automatically when packaging and scanning your app for Upload and Scan SAST, with more in-depth results visible using Agent-based SCA (see below).

- Infrastructure as Code (IaC) identifies misconfigurations and exposed secrets in declarative configuration files for cloud infrastructure.

- Software Bill of Materials (SBOM) is an industry-standardised, portal format for providing a structured inventory of open source components and their supply chain associations.

- Veracode develops and supports a number of methods and artifacts for submitting scans, reviewing reuslts and other operations. There are also unofficial plugins, scripts and artifacts developed by Veracoders or other customers which are not officially supported - these are collectively referred to as 'Veracode Community'. You can view a collection of these items at: https://github.com/veracode/Veracode-Community-Projects.

# Scan types in these files

- [Veracode Pipeline Scan SAST](https://docs.veracode.com/r/Pipeline_Scan) - Veracode's fastest SAST scan type in CI, suited for use in pipelines/branches with frequent commits. Will show results in CI build log and generate a results.json file, but results are not visible or linked to application profiles on Veracode platform. Use case is developers fixing findings earlier in their SSDLC. Parameters can be passed to configure output, check against Policy or baseline file.

- [Upload and Scan SAST, SCA](https://docs.veracode.com/r/Getting_Started_with_Static_Analysis) - Fully-featured SAST scan type, including basic SCA results and full visibility via Veracode web interface in application profiles. Suited to positioning where there are less frequent commits, as only one scan can be conducted at once and scans cannot be queued. Option to scan at the Policy level which shows compliance, or in a development Sandbox to check compliance without impacting pass/fail state.

- [Agent-based SCA](https://docs.veracode.com/r/Choosing_the_SCA_Scan_Type_for_Your_Use_Case) - For more in-depth SCA results, this scans a repo and provides enhanced information on vulnerabilities, vulnerable methods called by your code, license information and direct/transitive dependencies. Results are visible both in build log and in web user interface, making it suitable for use at any point in dev lifecycle. SBOM files can also be generated.

- [Veracode Container Security](https://docs.veracode.com/r/Veracode_Container_Security) - Veracode's CLI tool allows for the scanning of archives, repos, images and directories to produce information on SCA vulnerabilities, IaC misconfiguration, exposed secrets, SBOM and a policy pass/fail assessment.

# Methods of scan submission

There are a number of methods which can be used to submit scans, dependent on environment and preference. Whichever delivery method is chosen, the result will be the same. 

- API wrappers - Veracode's Java/C# wrappers can be used to submit scans from any command line/shell/bash environment, along with API querying/automation. [See this link for more information](https://docs.veracode.com/r/c_about_wrappers). Please be aware that some of the files/scripts in this repo will only work on either Linux or Windows environments.

- Plugins, Actions, Tasks - dependent on CI tool, these abstract the wrappers from the user to make configuration easier. Search the relevant marketplace to see Veracode official artifacts.

- Certified Docker images - containing wrappers for use in CI pipelines. [See this link to the images](https://hub.docker.com/u/veracode).

- Manual upload - You can use the web interface to manually conduct all scan types, with the exception of Agent-based SCA - useful as a fall-back in case pipelines stop working.

- Veracode CLI - tool invoked from the command line which can perform a variety of functions from SBOM generation to container image SCA results generation.

# Example of how scan types *could* be integrated

The below figure shows an example of *_potential_* use of scan types as part of branch structure. Entirely flexible based on your branching/DevOps pattern and commit frequency:

![Veracode integrations in branch structure](https://github.com/nbarhamvc/scriptarchive/blob/main/Exampleint.PNG?raw=true)

# Deliberately vulnerable test applications

These applications contain a number of intentional flaws and vulnerabilities which can be used to test different Veracode scan types in pipelines:

- [DotNET Verademo application](https://github.com/veracode/verademo-dotnet)
- [Java Verademo application](https://github.com/veracode/verademo)
