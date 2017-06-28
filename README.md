[![Docker Automated buil](https://img.shields.io/docker/automated/workflow4metabolomics/galaxy-workflow4metabolomics.svg?maxAge=2592000)](https://hub.docker.com/r/bgruening/galaxy-training-exome-seq/)
[![Docker Pulls](https://img.shields.io/docker/pulls/workflow4metabolomics/galaxy-workflow4metabolomics.svg?maxAge=2592000)](https://hub.docker.com/r/bgruening/galaxy-training-exome-seq/)
[![Docker Stars](https://img.shields.io/docker/stars/workflow4metabolomics/galaxy-workflow4metabolomics.svg?maxAge=2592000)](https://hub.docker.com/r/bgruening/galaxy-training-exome-seq/)
[![bioconda-badge](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg?style=flat)](http://bioconda.github.io)
[![Build Status](https://travis-ci.org/workflow4metabolomics/xcms.svg?branch=master)](https://travis-ci.org/workflow4metabolomics/xcms)

![workflow](/images/logo/logo-ifb-mono-metabohub_2.1_SD_150px.png)

Our project
-----------
The [Workflow4Metabolomics](http://workflow4metabolomics.org), W4M in short, is a French infrastructure offering software tool processing, analyzing and annotating metabolomics data. It is based on the Galaxy platform.

In the context of collaboration between metabolomics ([MetaboHUB French infrastructure](http://www.metabohub.fr/index.php?lang=fr)) and bioinformatics platforms ([IFB: Institut Français de Bioinformatique](http://www.france-bioinformatique.fr/en)), we have developed full LC/MS, GC/MS and NMR pipelines using Galaxy framework for data analysis including preprocessing, normalization, quality control, statistical analysis and annotation steps. Those modular and extensible workflows are composed with existing components (XCMS and CAMERA packages, etc.) but also a whole suite of complementary homemade tools. This implementation is accessible through a web interface, which guarantees the parameters completeness. The advanced features of Galaxy have made possible the integration of components from different sources and of different types. Thus, an extensible Virtual Research Environment (VRE) is offered to metabolomics communities (platforms, end users, etc.), and enables preconfigured workflows sharing for new users, but also experts in the field.

Citation
--------
Giacomoni F., Le Corguillé G., Monsoor M., Landi M., Pericard P., Pétéra M., Duperier C., Tremblay-Franco M., Martin J.-F., Jacob D., Goulitquer S., Thévenot E.A. and Caron C. (2014). Workflow4Metabolomics: A collaborative research infrastructure for computational metabolomics. Bioinformatics, [http://dx.doi.org/10.1093/bioinformatics/btu813](http://dx.doi.org/10.1093/bioinformatics/btu813)

Galaxy
------
Galaxy is an open, web-based platform for data intensive biomedical research. Whether on the free public server or your own instance, you can perform, reproduce, and share complete analyses. 

Homepage: [https://galaxyproject.org/](https://galaxyproject.org/)


![workflow](/images/workflow_all_HD_color_2.0.png)

How to contribute
-----------------

## Get your tools
All your tools are publicly available in [GitHub](https://github.com/workflow4metabolomics) and freely installable through the [Galaxy ToolShed](https://toolshed.g2.bx.psu.edu/groups#/175812cd7caaf439)

However, we will be glad to have [good] feedbacks on their usage in order to motivate us (and our funders).

It will also be great if you can cite our papers:

> Franck Giacomoni, Gildas Le Corguillé, Misharl Monsoor, Marion Landi, Pierre Pericard, Mélanie Pétéra, Christophe Duperier, Marie Tremblay-Franco, Jean-François Martin, Daniel Jacob, Sophie Goulitquer, Etienne A. Thévenot and Christophe Caron (2014). **Workflow4Metabolomics: A collaborative research infrastructure for computational metabolomics**. Bioinformatics 

[doi:10.1093/bioinformatics/btu813](https://doi.org/10.1093/bioinformatics/btu813)

## Show case mode
Your tools can be installed, integrated and hosted within the [main W4M instance Tools](https://galaxy.workflow4metabolomics.org/).
However, the tools must stick to the IUC standards in order to be easily integrated:
- [ ] Available in a GitHub repository
- [ ] [`planemo lint`](http://planemo.readthedocs.io/en/latest/commands/lint.html)
- [ ] [Conda dependencies](https://docs.galaxyproject.org/en/master/admin/conda_faq.html)
- [ ] Functional tests [`planemo test`](http://planemo.readthedocs.io/en/latest/commands/test.html)
- [ ] Available in the [Main ToolShed](https://toolshed.g2.bx.psu.edu/)

In the first place, your tools will be displayed in the `Contribution` section of the tool panel. And eventually, it should be promoted among the other tools.

## Advanced mode
In order to fully integrate your tools in our reference workflows, obviously they must respect the same standards showed above in the [Show case mode](#show-case-mode) but also follow your exchange format between tools (for more information, contact us).

A collaboration should be established if help is needed!

## Support / HelpDesk
In all cases, the tools must be maintained by the developers themselves. A tool can be removed if this after sales service isn't done.

Guidelines
----------

- [Writing a tool](GUIDELINES.md#writing-a-tool)
