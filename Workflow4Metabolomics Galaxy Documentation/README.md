[![example workflow](https://github.com/jsaintvanne/workflow4metabolomics/actions/workflows/publish.yml/badge.svg)](https://github.com/jsaintvanne/workflow4metabolomics/actions/workflows/publish.yml/badge.svg)


![workflow](/images/logo/logo-ifb-mono-metabohub_2.1_SD_150px.png)


# How to contribute to the documentation ?

If you want to contribute to this documentation on Worflow4Metabolomics, you will need to have a Github account first. Indeed, every files of this documentation are pushed in github and will stay there. To be able to accept new things from different people, we need to follow some rules :

- Start to fork the repository with 

![fork this thing](../images/fork_picture.png)
- Then you can work directly on github or also clone your repository (link clone)
- When you save your changes (with a commit) there should be an orange band like this one to ask you for a pull request ![This is my PR](../images/pull_request_picture.png)
- You just have to open this pull request and we will accept this if we consider that these changes are good for us


### Add informations on a page

If you just want to add some informations on a page or complete different informations it is quite easy to do. 
After following the previous steps, you just have to go in the file you want to change (on Github or on your local computer if cloned), make your changes and then save it in a new commit.
When your commit is saved with changes, the orange band will appear, propose to you to make a pull request to workflow4metabolomics repository. Click on this thing, explain your cahnges in your newly open pull request and save it.

When we will approve it, your cahnges will appear on the website.

### Create a new page

It is also possible to add a new page on the website. This is different with the previous point because you will need to change the `_quarto.yml` file also. To be able to do this, start to think about *where my new page can be?*. Then in the file named `_quarto.yml` find the good part and add it with these informations : 
```{R}
 - text: "Tools"
        icon: "tools"
        menu: 
          - text: "Tool 1"
            href: tool1.qmd
          - text: "My new tool"
            href: mynewtool.qmd
```

As you can see, you now need to create your new `mynewtool.qmd` file. In this file you can write all you want (according where it will be in the website of course!).
After all this completed, as in the previous point, just save and open the pull request explaining what you want to add to explain us why we should accept these changes.