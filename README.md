# LaTeX Template for short reports at PWr (WUST)

<!-- BADGES -->
<p align="left">
   <a href="https://github.com/Krisenberg/pwr-report-template/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue?logo=opensourceinitiative"/></a>
   <a href="https://www.repostatus.org/lifecycle"><img src="https://img.shields.io/badge/repo_status-active-FC6D26?logo=framework&color=#F10001"/></a>
</p>


## Overview
A simple LaTeX template for short reports at Wrocław University of Science and Technology. It's designed for lab reports and other short academic assignments that need professional formatting.

> [!NOTE]  
> This is not intended for research papers or thesis work.


## Preview
<p align="center">
  <img src="examples/first_page.png" width="48%" aria-label="First page screenshot from the example report"/>
  <img src="examples/last_page.png" width="48%" aria-label="Last page screenshot from the example report"/>
</p>


## Project Structure  
```
pwr-report-template/
│── examples/        # Example report (PDF file) and screenshots  
│── images/          # Example logos and figures
│── pwrReport.cls    # Custom LaTeX class file
│── references.bib   # Bibliography file (optional)
│── report.tex       # Main document template
│── section_one.tex  # Example section file (optional)
```


## 🔧 Setup

### 1. Prerequisites
You'll need a LaTeX distribution installed:
- [TeX Live](https://www.tug.org/texlive/) (cross-platform)
- [MiKTeX](https://miktex.org/) (Windows)
- [MacTeX](https://www.tug.org/mactex/) (macOS)

### 2. Compilation
Compile using your preferred LaTeX editor (Overleaf, TeXworks, VS Code with LaTeX Workshop):
```sh
pdflatex report.tex   # or use a LaTeX editor's build button
```

### 3. Customization
Edit the `report.tex` to set your report details:
```latex
% -------------------- Title Page Information --------------------
\title{Your Report Title}
\titleShort{Short Title}
\courseName{Course Name}
\courseNameShort{CName}  % Shortened course name (if needed)
\author{Your Name}
\date{Submission Date}
```

You can also customize various elements:
```latex
% -------------------- Customization --------------------
\tableOfContentsName{My Custom ToC}  % Custom name for Table of Contents
\referencesName{Custom references} % Custom References name
\figureName{Custom fig.}  % Custom figure name
\tableName{Custom tab. name}  % Custom table name
\titlePageLogoLeft{images/pwr/logo_pwr.png}  % Left logo on title page
\titlePageLogoRight{images/pwr/logo_wit.png} % Right logo on title page
\tableOfContentsNameTopMargin{3cm}  % Adjusts top margin for TOC
```


## Contributing
Contributions are welcome! If you have suggestions or improvements, please open an issue or pull request.


## License  
This template is released under the **MIT License** - see the [LICENSE](LICENSE) file for details.
