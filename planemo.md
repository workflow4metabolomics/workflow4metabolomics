# Guide for to use Planemo on Windows and so bits of git

## Planemo Virtual Machine
### Prerequisite
- [VirtualBox](https://www.virtualbox.org/)
- Planemo OVA image: https://images.galaxyproject.org/planemo/latest.ova

### 1- Configure the VM before launch
1. Right click on the image name
2. Configuration...
  - System|Système:
    - Carte mère|Mother board:
      - Fix the Memory with the slider to at least 4000Mo if you can. Otherwise, 2000Mo will be ok.
    - Processor|Processeur
      - Fix the number to 2 (or 1) depending of your hardware

TODO image

### 2- Launch the VM


### 3- Configure after the launch
@TODO: keyboard ...


## git clone tools_metabolomics
Open a Terminal

### Adding a new SSH key to your GitHub account
Source: [GitHub documentation](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

#### 1. Generating a new SSH key
```bash
$ ssh-keygen -t ed25519 -C "your_email@example.com"
[Return]
[Return]
[Return]
[Return]
```

#### 2. Adding it to GitHub
```bash
$ pbcopy < ~/.ssh/id_ed25519.pub
$ # Copies the contents of the id_ed25519.pub file to your clipboard
$
```

Follow the steps of this page: [adding-a-new-ssh-key-to-your-github-account](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

### 3. Configure your email on git
@TODO
```bash
$ git config
```

### git clone
We will pull a local copy of the [tools-metabolomics GitHub repository](https://github.com/workflow4metabolomics/tools-metabolomics)

```bash
$ cd ~
$ git clone git@github.com:workflow4metabolomics/tools-metabolomics.git
$ cd ~/tools-metabolomics
```

### Branches
#### List the available branches
To list all the branch already available on the remote repo and now in local
```bash
$ git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/biotool-edam
  remotes/origin/master
  remotes/origin/mixmodel4repeated_measures
  remotes/origin/nmr_bucketing2
```

- The `*` is showing your current branch, here the master
- The `remotes/origin/` are corresponding to branches that are online at [tools-metabolomics/branches](https://github.com/workflow4metabolomics/tools-metabolomics/branches)

#### Switch to an existing remote branch
If you want to work on an existing branch that is only

```bash
$ git checkout -b nmr_bucketing2 origin/nmr_bucketing2
Branch 'nmr_bucketing2' set up to track remote branch 'nmr_bucketing2' from 'origin'.
Switched to a new branch 'nmr_bucketing2'

$ # It created a local branch from the remote one
$ # and switch to it

$ git branch
  master
* nmr_bucketing2
```

#### Switch to a local branch
```bash
$ git branch
  master
* nmr_bucketing2

$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
$ git branch
* master
 nmr_bucketing2

$ git checkout nmr_bucketing2
Switched to branch 'nmr_bucketing2'
Your branch is up to date with 'origin/nmr_bucketing2'.
$ git branch
 master
* nmr_bucketing2
```

We switched from `nmr_bucketing2` to `master` to `nmr_bucketing2` again

#### Or create a new branch
Always create a new branch from a synchronized master branch
```bash
$ git checkout master # switch to your local master branch
$ git pull origin master # Sync your local master from the remote one

$ git checkout -b my_new_tool
$ git branch
 master
* my_new_tool
```

### Keep your local branches up-to-date
It's important to keep your branch up-to-date

#### Sync with the remote branch
If a contributor add commit to a Pull Request (PR), you have to synchronize your local branch

```bash
$ git branch
 master
* nmr_bucketing2

$ git pull origin nmr_bucketing2
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 10 (delta 4), reused 8 (delta 4), pack-reused 1
Unpacking objects: 100% (10/10), done.
From github.com:workflow4metabolomics/workflow4metabolomics
 * branch            master     -> FETCH_HEAD
   3109335..ce226c3  master     -> origin/master
Updating 3109335..ce226c3
Fast-forward

 tools/nmr_bucketing/NmrBucketing_wrapper.R  |    6 +-
 tools/nmr_bucketing/NmrBucketing_xml.xml    | 2008 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 2011 insertions(+), 3 deletions(-)

$ # Outch! It was time!

$ git pull origin nmr_bucketing2
From github.com:workflow4metabolomics/tools-metabolomics
 * branch            nmr_bucketing2 -> FETCH_HEAD
Already up to date.

$ # Nothing to fetch, you are up-to-date
```

You might have some conflicts. It occurs when 2 contributors work on the same file too closely in parallel. Try to avoid that, it's annoying. If so, good luck but please refer to extra documentations.

#### Sync your local branch with the remote master
If the master only is moving, you may want to integrate its new commits

```bash
$ # First we will sync your local master
$ git checkout master
$ git pull origin master
[...]

$ # Then your local branch
$ git pull origin nmr_bucketing2 # It's worth doing
$ git checkout nmr_bucketing2
$ git merge origin master
[...]

$ # Finally, we have to sync the remote version of your branch
$ git push origin nmr_bucketing2
```

Now all is synchronize, you can work!
