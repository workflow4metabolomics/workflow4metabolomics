Workflow4Metabolomics Project
=============================

Our project
-----------
The [Workflow4Metabolomics](http://workflow4metabolomics.org), W4M in short, is a French infrastructure offering software tool processing, analyzing and annotating metabolomics data. It is based on the Galaxy platform.

Citation:
Giacomoni F., Le Corguillé G., Monsoor M., Landi M., Pericard P., Pétéra M., Duperier C., Tremblay-Franco M., Martin J.-F., Jacob D., Goulitquer S., Thévenot E.A. and Caron C. (2014). Workflow4Metabolomics: A collaborative research infrastructure for computational metabolomics. Bioinformatics, [http://dx.doi.org/10.1093/bioinformatics/btu813](http://dx.doi.org/10.1093/bioinformatics/btu813)

Galaxy
------
Galaxy is an open, web-based platform for data intensive biomedical research. Whether on the free public server or your own instance, you can perform, reproduce, and share complete analyses. 

Homepage: [https://galaxyproject.org/](https://galaxyproject.org/)


![workflow](/images/workflow_all_HD_color_2.0.png)

How to contribute
-----------------

**To be defined.**

Writing a tool
--------------

### Creating a tool repository



#### Writing the tool XML file

As a reference, see the [Tool XML file syntax](https://wiki.galaxyproject.org/Admin/Tools/ToolConfigSyntax) from the Galaxy project wiki.

### Using Planemo to validate a tool

[Planemo](https://github.com/galaxyproject/planemo) is part of the Galaxy project, and is made for easing the development and testing of Galaxy tools. A [documentation](http://planemo.readthedocs.org/en/latest/index.html) is available, so we will give here only the basic knowledge.
A [French course (slides)](http://www.france-bioinformatique.fr/sites/default/files/gd2015-planemo-1.0_0.pdf) given at the Galaxy Day (Nov. 11 2015) is also available.
 
We suppose you have a tool repository with the following files:
	mytool.xml
	mytool-script

#### Installing Planemo

Under macOS, use Homebrew for installing Planemo:
```bash 
brew tap galaxyproject/tap
brew install planemo
```

#### Writing correctly your tool XML file for Planemo

##### Order of sections

The sections of your tool XML file, must be in the specific order:

 1. description.
 2. requirements.
 3. command.
 4. inputs.
 5. outputs.
 6. tests.
 7. help.
 8. citations.

##### Requirements

If your script `mytool-script` is written in R, and have the following R library dependencies: `batch`, `PMCMR`, you have to define the following lines inside your tool XML file:
```xml
<requirements>
	<requirement type="package" version="3.2.2">R</requirement>
	<requirement type="package">r-batch</requirement>
	<requirement type="package">r-pmcmr</requirement>
</requirements>
```
Requirements will be looked for inside the [bioconda](https://bioconda.github.io/index.html) GitHub repository and installed by conda inside a virtual environment. Thus you can check there if your particular package is defined, or if the specific version your tool requests is provided.
In this example, the R language version 3.2.2 will be installed, as well as the batch and PMCMR R libraries (no version specified, but that could have been possible).

##### Command

You must not use anymore the attribute `interpreter` inside the command tag. This means that your tool program must be executable directly:
```xml
<command><![CDATA[
	$__tool_directory__/mytool-script
	...
]]></command>
```

For script languages, you have to add a shebang line at the first line of the file. For instance for an R script:
```r
#!/usr/bin/env Rscript
```

##### Tests

At least one test is required.

The `param` tags describe the inputs.
```xml
<tests>
	<test>
		<param name="dbfile" value="filedb.tsv"/>
		<param name="mzrtinput" value="mzrt-input-small.tsv"/>
		<param name="inputfields" value=""/>
		<param name="mzmode" value="pos"/>
		<output name="mainoutput" file="filedb-small-mz-match-output.tsv"/>
		<output name="peaksoutput" file="filedb-small-mz-match-peaks-output.tsv"/>
		<output name="htmloutput" file="filedb-small-mz-match-html-output.html"/>
	</test>
</tests>
```
The input and output files must be placed in a folder named `test-data` in the same location as your tool XML file.

##### Help

An help section is required.

##### Citations

This sections is required, as a good practice.
In the case you have nothing to put inside this section, and in order to make the `planemo lint` pass, just write an empty section:
```xml
<citations/>
```

#### Testing that your tool XML file is written correctly

Running planemo on an XML tool file:
```bash
planemo lint mytool.xml
```

It will output a list of checks as the following one:
```
Applying linter tests... CHECK
.. CHECK: 1 test(s) found.
Applying linter stdio... CHECK
.. INFO: No stdio definition found, tool will determine an error from stderr.
Applying linter output... CHECK
.. INFO: 2 outputs found.
Applying linter inputs... CHECK
.. INFO: Found 7 input parameters.
Applying linter help... CHECK
.. CHECK: Tool contains help section.
.. CHECK: Help contains valid reStructuredText.
Applying linter general... CHECK
.. CHECK: Tool defines a version [2.1.1].
.. CHECK: Tool defines a name [Univariate].
.. CHECK: Tool defines an id [Univariate].
Applying linter command... CHECK
.. INFO: Tool contains a command.
```

#### Run the tests on your tool

If not already done, initialize conda:
```bash
planemo conda_init
```

Install your tool requirements:
```bash
planemo conda_install mytool.xml
```

Run your tests:
```bash
planemo test --galaxy_branch release_16.01 --conda_dependency_resolution mytool.xml
```

#### Using Ant to run Planemo

Here is a `build.xml` file you can use as a base for running Planemo from Ant:
```xml
<project name="mytool" default="all">

	<property name="tool.xml" value="mytool.xml"/>

	<!--~~~
	~ ALL ~
	~~~~~-->

	<target name="all"/>

	<!--~~~~
	~ TEST ~
	~~~~~-->

	<target name="test" depends="planemo.lint,planemo.test"/>

	<!-- PLANEMO LINT -->
	<target name="planemo.lint">
		<exec executable="planemo" failonerror="true">
			<arg value="lint"/>
			<arg value="${tool.xml}"/>
		</exec>
	</target>

	<!-- PLANEMO TEST -->
	<target name="planemo.test">
		<exec executable="planemo" failonerror="true">
			<arg value="conda_install"/>
			<arg value="${tool.xml}"/>
		</exec>
		<exec executable="planemo" failonerror="true">
			<arg value="test"/>
			<arg value="--galaxy_branch"/>
			<arg value="release_16.01"/>
			<arg value="--conda_dependency_resolution"/>
			<arg value="${tool.xml}"/>
		</exec>
	</target>

</project>
```

### Using Travis to automate testing
