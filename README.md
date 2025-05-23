[![Docker Automated buil](https://img.shields.io/docker/automated/workflow4metabolomics/galaxy-workflow4metabolomics.svg?maxAge=2592000)](https://cloud.docker.com/u/workflow4metabolomics/repository/docker/workflow4metabolomics/galaxy-workflow4metabolomics)
[![Docker Pulls](https://img.shields.io/docker/pulls/workflow4metabolomics/galaxy-workflow4metabolomics.svg?maxAge=2592000)](https://cloud.docker.com/u/workflow4metabolomics/repository/docker/workflow4metabolomics/galaxy-workflow4metabolomics)
[![Docker Stars](https://img.shields.io/docker/stars/workflow4metabolomics/galaxy-workflow4metabolomics.svg?maxAge=2592000)](https://cloud.docker.com/u/workflow4metabolomics/repository/docker/workflow4metabolomics/galaxy-workflow4metabolomics)
[![bioconda-badge](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg?style=flat)](http://bioconda.github.io)
[![Build Status](https://travis-ci.org/workflow4metabolomics/xcms.svg?branch=master)](https://travis-ci.org/workflow4metabolomics/xcms)
[![example workflow](https://github.com/jsaintvanne/workflow4metabolomics/actions/workflows/publish.yml/badge.svg)](https://github.com/jsaintvanne/workflow4metabolomics/actions/workflows/publish.yml/badge.svg)

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


![workflow](/images/workflow/bigpicture.png)

How to contribute
-----------------

### Get our tools
All our tools are publicly available in [GitHub](https://github.com/workflow4metabolomics) and freely installable through the [Galaxy ToolShed](https://toolshed.g2.bx.psu.edu/groups#/175812cd7caaf439)

However, we will be glad to have [good] feedbacks on their usage in order to motivate us (and our funders).

It will also be great if you can cite our papers:

> Franck Giacomoni, Gildas Le Corguillé, Misharl Monsoor, Marion Landi, Pierre Pericard, Mélanie Pétéra, Christophe Duperier, Marie Tremblay-Franco, Jean-François Martin, Daniel Jacob, Sophie Goulitquer, Etienne A. Thévenot and Christophe Caron (2014). **Workflow4Metabolomics: A collaborative research infrastructure for computational metabolomics**. Bioinformatics 

[doi:10.1093/bioinformatics/btu813](https://doi.org/10.1093/bioinformatics/btu813)

### Push your tools / W4M as a Showcase
Your tools can be installed, integrated and hosted within the [main W4M instance Tools](https://galaxy.workflow4metabolomics.org/).

#### Quality standards
However, the tools must stick to the IUC standards in order to be easily integrated:
- [ ] Available in a GitHub repository
- [ ] [Conda](https://docs.galaxyproject.org/en/master/admin/conda_faq.html) dependencies
- [ ] Functional tests using [Planemo](https://planemo.readthedocs.io/en/latest/#)
- [ ] Available in the [Main ToolShed](https://toolshed.g2.bx.psu.edu/)

In the first place, your tools will be displayed in the `Contribution` section of the tool panel. And eventually, it should be promoted among the other tools.

#### Advanced mode
In order to be fully integrated in our reference workflows, your tools must follow your exchange formats between tools (for more information, contact us).

A collaboration should be established if help is needed!

#### Support / HelpDesk
In all cases, the tools must be maintained by the developers themselves. A tool can be removed if this after sales service isn't done.

Guidelines
----------

- [Writing a tool](GUIDELINES.md#writing-a-tool)
























[![example workflow](https://github.com/jsaintvanne/workflow4metabolomics/actions/workflows/publish.yml/badge.svg)](https://github.com/jsaintvanne/workflow4metabolomics/actions/workflows/publish.yml/badge.svg)


![workflow](/images/logo/logo-ifb-mono-metabohub_2.1_SD_150px.png)


# How to contribute to the documentation?

If you want to contribute to this documentation on Workflow4Metabolomics, you will need to have a Github account first. Indeed, every files of this documentation are pushed in github and will stay there. To be able to accept new things from different people, we need to set some steps to follow:

1. Start by forking the repository: 

![fork this thing](../images/fork_picture.png)

2. Then you can work directly on github or clone the repository to your local environment (link clone)

3. Once you have saved your changes (with commits pushed on your forked repository) there should be an orange band like the following to ask for a pull request ![This is my PR](../images/pull_request_picture.png)

4. You just have to open this pull request and we will review it in order to validate it. Please think about explaining your changes in your newly opened pull request for us to know what is is all about. Once the pull request is aprouved, changes will appear on the website.


### Tip: Adding information on a page

If you just want to add some information on an existing page or update some deprecated information, it is quite easy to do. 
During the previous step n°2, you just have to open the file you want to change (on Github or on your local computer if cloned), make your changes and then save it in a new commit.
When your commit is saved with changes, the orange band will appear and you can proceed with the previous step n°3 (or continue by updating further content). 

### Tip: Creating a new page

It is also possible to add a new page on the website. This is different from the previous point because you will need to change the `_quarto.yml` file also. To be able to do this, start with thinking about *Where can my new page be on the website? A new item in the menu? A new tab in an existing one?*. 
Then in the file named `_quarto.yml` find the good part and add it with these information: 
```{R}
 - text: "Tools"
        icon: "tools"
        menu: 
          - text: "Tool 1"
            href: tool1.qmd
          - text: "My new tool"
            href: mynewtool.qmd
```

As you can see, you now need to create your new `mynewtool.qmd` file. In this file you can write all you want (in accordance with where it will be in the website of course!).
After all this is completed, as in the previous tip, just save and open the pull request explaining what you want to add for us to be able to evaluate its accordance to the website.