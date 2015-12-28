# Getting Started

# Tools

There are a small number of tools that form the core of the workflow needed for this project. If you haven't worked with these tools before they may seem intimidating, but the tasks to accomplish in this project are designed to be straightforward and help will be available so that you can pick up everything that you need.

## Github

Github is a free online service that keeps track of code and documentation. We will store all of the work for this project in a github "repository", and others will be able to reproduce this work by "cloning" this repository and following the instructions laid out here.

Quick note/caveat: It is inefficient to store anything over ~10MB in github, and so while the project will generate some intermediate files that are quite large (raw reads, aligned reads, etc.), we will only store the results (e.g. numbers of reads mapped per gene) in the github repository.

Here is a very quick guide to git: [http://rogerdudler.github.io/git-guide/](http://rogerdudler.github.io/git-guide/)
Quick reference for commands: [https://git.wiki.kernel.org/index.php/QuickStart](https://git.wiki.kernel.org/index.php/QuickStart)

To start out:

1.  Create your own account on [github.com](github.com).
2.  Fork the base repository ([link](https://github.com/sminot/x-gene-expression)) to your account.

Typical everyday operations:

1.  Make sure you're working on the most up-to-date copy of the repository (`git pull` or `git clone <repo>` if you're working on a new machine).
2.  After you're done with your analysis for the day, `git add <files>`, `git commit`, and `git push` any changed files.


## Amazon Web Services

The basic approach we're going to take is to do the heavy computational work on an AWS server. Each time you start up a new machine it comes with a blank operating system, and so the repository will contain a script that sets up the machine with all of the programs and libraries needed to perform the analysis. All of the biological data we are analyzing can be downloaded from public NCBI servers. After each piece of analysis is done, we save the results file to the github repository and then it's safe to shut down the AWS machine without fear of losing the work that we did. The idea is that anyone can boot up an AWS machine, clone our repository, run the scripts, and get the exact same answer that we did.

To start out:

1.  Create an AWS account -- EC2 is the service that provides computational servers that we'll use.
2.  Read some background on using AWS EC2 instances -- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
3.  Launch a free t2.micro instance for practice
  -  Set your security group IP so that you'll be able to log on via SSH
  -  Create a security key pair
  -  Connect to the instance via SSH
  -  Terminate the instance

Typical everyday operations:

1.  Boot up an instance
2.  Log in to that computer at the IP address provided
3.  Clone your repository into the home directory -- `git clone git@github.com:sminot/x-gene-expression.git`
3.  A folder will be created, `x-gene-expression/`, containing all of the files in this repository.
4.  Move into that directory and execute the `setup_instance.sh` script to set up the machine.
5.  Move into the directory for the step that you are working on (`expression`, `orthologs`, etc.), and work on your analysis.
6.  When you're done, add, commit, and push all your changes to github.
7.  If you're going to be using the instance again soon, just log out and leave it running. If you're going to be gone for a few days (or it's an expensive instance), log out and terminate the instance. It's always easier to leave machines running than to restart and reconfigure new machines, but we just want to be sure not to run up a giant AWS bill.


## Command Line Interface (Linux / OS X)

All of the standard computational biology tools are written to run on the Linux operating system, and it will be necessary to use the command line to execute the analyses described here.

If you're not used to the command line ("shell"), this may seem incredibly overwhelming, so here are some basic command that are going to cover everything you'll need here:
*  `pwd` -- What directory am I in?
*  `ls` -- List the contents of the current directory
*  `cd` -- Change the directory I am in
*  `mv file.txt destination/` -- Move `file.txt` into the folder named `destination/`
*  `nano setup_instance.sh` -- Open a text editor and edit `setup_instance.sh`
*  `bash setup_instance.sh` -- Execute the BASH script `setup_instance.sh`
*  `python run_analysis.py` -- Execute the Python script `run_analysis.py`

There are a few different command-line text editors -- I like `nano`. Here's a guide to using it: [http://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/](http://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/). Very simply, you save files with `Ctrl O` and close files with `Ctrl X`. I only mention this because when you're working on an AWS instance, you will only be able to edit files using a command-line editor (no Notepad available...).

For more depth, take a look at one of these guides to using the "shell" -- [http://linuxcommand.org/lc3_learning_the_shell.php](http://linuxcommand.org/lc3_learning_the_shell.php) or [http://ryanstutorials.net/linuxtutorial/](http://ryanstutorials.net/linuxtutorial/) . There's a more detailed guide to BASH here -- [http://guide.bash.academy/](http://guide.bash.academy/) and here, [http://www.tldp.org/LDP/Bash-Beginners-Guide/html/](http://www.tldp.org/LDP/Bash-Beginners-Guide/html/). **These have a lot of advanced concepts that we're frankly not going to worry about.** The commands I have listed above will get you pretty far.

