# portable
Simple improvements for portable version of development tools: Git + node + VS Code

Git portable: https://git-scm.com/downloads
- eg. direct link https://github.com/git-for-windows/git/releases/download/v2.10.1.windows.1/PortableGit-2.10.1-64-bit.7z.exe

node portable: https://nodejs.org/dist 
- eg. direct link https://nodejs.org/dist/v6.9.1/node-v6.9.1-win-x64.zip

Visual Studio Code portable: https://code.visualstudio.com/Download
- eg. direct link https://code.visualstudio.com/docs/?dv=winzip

1) Put your Git, node and VS Code applications to the specified folders in this project.

2) Now you be able to:
- run "Portable Bash.cmd" to start unix-like console for git & node,
- run "Portable VS Code.cmd" to start Visual Studio Code,

3) Short description
- "portable/home/" is your home directory,
- "portable/home/projects/" is working directory; This is the place you should create a sub-folder for each of your project,
- "portable/.ssh/" is your SSH key storage,
- "portable/.ssh/config" is your SSH configuration (eg. edit this file if you want to use more than one key).

4) (Optional)
- delete "portable/.git/" to remove repository instance
- initialize a new git repository for each project you create