# Guide for git

## git - init your working repository
Open a Terminal

### Adding a new SSH key to your GitHub account
Source: [GitHub documentation](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

#### 1. Generating a new SSH key
```bash
$ ssh-keygen -t ed25519 -C "your_email@example.com"
[Return]
[Return]
[Return]
```

#### 2. Adding it to GitHub
```bash
$ cat ~/.ssh/id_ed25519.pub
ssh-ed25519 AAAAC3NzaC1lZAAIMC3HzobwbYkEO0xvwx0E6sLp3RiKs13fDI1NTE5AAjBOLb5MDSsE your_email@example.com
$
```

Follow the steps of this page: [adding-a-new-ssh-key-to-your-github-account](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

#### 3. Configure your email on git
You need to configure your user name and email to commit in git.

**/!\** Use the email address that the one of your GitHub account.

```bash
$ git config --global user.name "Chuck Norris"
$ git config --global user.email "your_email@example.com"
```

### git clone
We will pull a local copy of the [tools-metabolomics GitHub repository](https://github.com/workflow4metabolomics/tools-metabolomics)

```bash
$ cd ~
$ git clone git@github.com:workflow4metabolomics/tools-metabolomics.git
$ cd tools-metabolomics
```

### Branches

![](../images/docs_developers/git/git-branches-merge.png)
*Schema of a git repository with 2 feature branches ([source](https://www.nobledesktop.com/learn/git/git-branches))*

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


## git - push your changes
At some point and regularly, you will have to push your commits to the remote only server.

The number of commit is important and not.

It's a balance:
- Too many commits is not really useful because it's not informative
- Too few commits is not a good idea if you want to remote a commit for example.
The good balance is in the middle, you should have at least one commit per features or relevant modifications.

1. Be sure to not be on the master branch
2. Sync with the remote branch
3. Sync your local branch with the remote master
4. Commit and Push

```bash
$ # Check the current branch
$ git branch
  master
* normalization_update

$ # Check what have changed since the last commit
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   NmrNormalization_xml.xml

no changes added to commit (use "git add" and/or "git commit -a")
$ # Here the NmrNormalization_xml.xml have been modified

$ # You can visualize the diff
$ git diff
diff --git a/tools/normalization/NmrNormalization_xml.xml b/tools/normalization/NmrNormalization_xml.xml
index 45cb84d..9e40ff7 100644
--- a/tools/normalization/NmrNormalization_xml.xml
+++ b/tools/normalization/NmrNormalization_xml.xml
@@ -1,9 +1,9 @@
-<tool id="normalization" name="Normalization" version="1.0.7">
+<tool id="normalization" name="Normalization" version="1.0.8">

     <description> Normalization of (preprocessed) spectra </description>

     <requirements>
-          <requirement type="package" version="1.1_4">r-batch</requirement>
+          <requirement type="package" version="1.1_5">r-batch</requirement>
     </requirements>

       <stdio>
$ git commit -m "normalization - update r-batch"
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
	modified:   NmrNormalization_xml.xml

no changes added to commit


$ # You add the change to the future commit
$ git add NmrNormalization_xml.xml

$ # Note that you can add other changes

$ # Wrap a commit and fill an explicit message
$ git commit -m "normalization - update r-batch"
[master 51ed5fe] normalization - update r-batch
 1 file changed, 2 insertions(+), 2 deletions(-)

$ # With status, you can check that there isn't any changes left
$ # And that you have commit to push to the remote repository
$ git status
 On branch master
 Your branch is ahead of 'origin/master' by 1 commit.
   (use "git push" to publish your local commits)

 nothing to commit, working tree clean

$ # Note that you can stack many commit before pushing them

$ # git push will push your local commit to the remote branch
$ git push origin normalization_update
```

Congrats!