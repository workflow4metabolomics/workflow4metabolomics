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
The [Galaxy Intergalactic Utilities Commission Standards and Best Practices](https://galaxy-iuc-standards.readthedocs.io/en/latest/) are also worth reading.

### Using Planemo to validate a tool

[Planemo](https://github.com/galaxyproject/planemo) is part of the Galaxy project, and is made for easing the development and testing of Galaxy tools. A [documentation](http://planemo.readthedocs.org/en/latest/index.html) is available, so we will give here only the basic knowledge.
A [French course (slides)](http://www.france-bioinformatique.fr/sites/default/files/gd2015-planemo-1.0_0.pdf) given at the Galaxy Day (Nov. 11 2015) is also available.
 
We suppose you have a tool repository with the following files:
```
mytool.xml
mytool-script
```

Planemo uses a directory for storing data. Default is `~/.planemo`, but it can be changed through the `--directory` option:
```bash
planemo --directory /my/planemo/folder/path ...
```

#### Installing Planemo

##### macOS

Under macOS, use Homebrew for installing Planemo:
```bash
brew tap galaxyproject/tap
brew install planemo
```

##### In a virtual environment

```bash 
virtualenv ~/.planemo-venv
. ~/.planemo-venv/bin/activate
pip install planemo
```

Before using Planemo on your terminal, you will need to activate your virtualenv environment:
```bash
. ~/.planemo-venv/bin/activate
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

You must not use anymore the attribute `interpreter` inside the command tag. The command content will be launched inside a bash session. The programs called must be present inside the `PATH`, so it must be a standard program (unless you find a way to put your tool program inside the PATH, but we do not recommand that).

Here is an example with a script in R:
```xml
<command><![CDATA[
	Rscript $__tool_directory__/mytool-script
	...
]]></command>
```
Note the use of the `$__tool_directory__` variable. This is because, according to our experience, `planemo test` may fail to find your script if the whole is not specified.

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

More documentation here: https://wiki.galaxyproject.org/Admin/Tools/WritingTests

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

##### Conda directory

Conda installs all its files inside `~/miniconda2` by default.
When testing the requirements, it may be that you forget to specify some requirements for your tool, but that your test pass anyway. This is because the requirements were already installed inside `~/miniconda2`, possibly while testing another tool.

A first solution to avoid this is to erase the `~/miniconda2` before running `planemo conda_install .`.

A second solution is to choose a custom folder for conda for your tool through the `--conda_prefix` option:
```bash
planemo conda_init --conda_prefix conda.local
planemo conda_install --conda_prefix conda.local mytool.xml
planemo test --conda_prefix conda.local --galaxy_branch release_16.01 --conda_dependency_resolution mytool.xml
```

Attention to not choose a too much long prefix, otherwise it could give issue with R Ncurses package, in case your tool depends on it. You would get the error `Error: ERROR: placeholder '/Users/aaronmeurer/anaconda/envs/_build_placehold_placehold_placehold_placehold_' too short in: ncurses-5.9-1`. This issue will be solved in Conda-Build 2.0.0.

#### Developing a new recipe for bioconda

The tests may fail if the requirements cannot be found neither in conda nor in bioconda. Thus you may be forced to develop a new recipe for bioconda in order for the tests to pass.

To develop a new recipe, either ask to be part of Bioconda team for contributing to new recipes (repository bioconda-recipes) as explained in [Bioconda recipes README](https://github.com/bioconda/bioconda-recipes), or fork [bioconda-recipes](https://github.com/bioconda/bioconda-recipes) and send a pull-request.

Follow the instructions in [Bioconda recipes README](https://github.com/bioconda/bioconda-recipes).

##### Installing conda

For testing your recipe, you will need conda.

Installing miniconda on macOS:
```bash
brew cask install miniconda
```
The installation is done in `~/miniconda3`. The binaries are installed inside `~/miniconda3/bin`.

Then install `conda-build`:
```bash
~/miniconda3/bin/conda install conda-build
```

To later update your conda installation:
```bash
conda update conda
conda update conda-build
```

##### Write your recipe

To write your recipe, follow the instructions in [Guidelines for bioconda recipes](https://github.com/bioconda/bioconda-recipes/blob/master/GUIDELINES.md). You will find instructions for each development language. For instance for writing a recipe for a R CRAN package, use the skeleton generator:
```bash
cd recipes
~/miniconda3/bin/conda skeleton cran mypkg
```

##### Build your recipe

To build your recipe, run:
```bash
~/miniconda3/bin/conda build recipes/myrecipe
```
If it is a R package add the option `--channel r`, and if it depends on other bioconda recipes add `--channel bioconda`.

See also [Conda build recipes](http://conda.pydata.org/docs/building/recipe.html).

##### Publish

Now you just have to send a pull-request and wait, Travis CI will run the tests, and merge your recipe automatically into the master branch in case of success.

#### Using Ant to run Planemo

Here is a `build.xml` file you can use as a base for running Planemo from Ant:
```xml
<project name="mytool" default="all">

	<property name="tool.xml" value="mytool.xml"/>
	<property name="conda.dir" value="${user.home}/w4m-conda"/>

	<!--~~~
	~ ALL ~
	~~~~~-->

	<target name="all"/>

	<!--~~~~
	~ TEST ~
	~~~~~-->

	<target name="test" depends="planemo.lint,planemo.test"/>

	<!--~~~~~~~~~~~~
	~ PLANEMO LINT ~
	~~~~~~~~~~~~~-->

	<target name="planemo.lint">
		<exec executable="planemo" failonerror="true">
			<arg value="lint"/>
			<arg value="${tool.xml}"/>
		</exec>
	</target>

	<!--~~~~~~~~~~~~
	~ PLANEMO TEST ~
	~~~~~~~~~~~~~-->

	<target name="planemo.test" depends="planemo.conda.install">
		<exec executable="planemo" failonerror="true">
			<arg value="test"/>
			<arg value="--conda_prefix"/>
			<arg value="${conda.dir}"/>
			<arg value="--galaxy_branch"/>
			<arg value="release_16.01"/>
			<arg value="--conda_dependency_resolution"/>
			<arg value="${tool.xml}"/>
		</exec>
	</target>

	<!--~~~~~~~~~~~~~~~~~~~~~
	~ PLANEMO CONDA INSTALL ~
	~~~~~~~~~~~~~~~~~~~~~~-->

	<target name="planemo.conda.install" depends="planemo.conda.init">
		<exec executable="planemo" failonerror="true">
			<arg value="conda_install"/>
			<arg value="--conda_prefix"/>
			<arg value="${conda.dir}"/>
			<arg value="${tool.xml}"/>
		</exec>
	</target>

	<!--~~~~~~~~~~~~~~~~~~
	~ PLANEMO CONDA INIT ~
	~~~~~~~~~~~~~~~~~~~-->

	<target name="planemo.conda.init">
		<exec executable="planemo" failonerror="true">
			<arg value="conda_init"/>
			<arg value="--conda_prefix"/>
			<arg value="${conda.dir}"/>
		</exec>
	</target>

	<!--~~~~~
	~ CLEAN ~
	~~~~~~-->

	<target name="clean">
		<delete dir="${conda.dir}"/>
	</target>

</project>
```

### Using Travis to automate testing

[Travis CI](https://travis-ci.org) is a continuous integration service, used in Workflow4Metabolomics. If you are already part of the Workflow4Metabolomics team, you just have to connect into Travis CI using the "Sign with GitHub" button on the [Travis CI](https://travis-ci.org) home page. Then you just have to connect the organization account to your Travis account.
Follow the instructions on the [Getting started](https://docs.travis-ci.com/user/getting-started/) page.

Roughly, the steps are the following ones:

 1. Go to your profile page (click on your name at the top right).
 2. Make sure Workflow4Metabolomics is listed in the Organizations listing inside the left column.
 3. Click on `Sync account` button (at the top right), and wait.
 4. Enable the project you want. This will allow Travis CI to track for changes in branches and run the build.
 5. Define a file `.travis.yml` at the root of your project repository. This file will tell Travis CI how to build/test your project.
 6. Push the changes in your project repository to GitHub, Travis CI will automatically be triggered and start running the instructions contained inside the file `.travis.yml`.

A minimal `.travis.yml` that makes use of Planemo and Ant can be:
```yaml
before_install:
 - sudo apt-get install -y python-virtualenv
 - sudo apt-get install -y ant
 - virtualenv planemo-venv
 - . planemo-venv/bin/activate
 - pip install planemo
 - planemo conda_init

script:
 - ant test
```
