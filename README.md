# portable
Simple improvements for portable version of development tools: Git + Node.js + VS Code

# quick start

1) Copy your Git, node and VS Code applications to the specified folders in this project.

2) Now you be able to:
- run "Portable Bash.cmd" to start unix-like console for git & node.js,
- run "Portable VS Code.cmd" to start Visual Studio Code,

3) Short description
- "portable/home/" is your home directory,
- "portable/home/projects/" is working directory; This is the place you should create a sub-folder for each of your project,
- "portable/.ssh/" is your default SSH configuration folder,
- "portable/.gnupg/" is your default PGP configuration folder.

4) (Optional)
- delete "portable/.git/" folder to remove repository instance.

5) Run "Portable Bash.cmd",
-- if you prefer HTTPS protocol for git type:
-- git clone https://github.com/stackpl/quickstart.git
- if you prefer SSH for github:
-- git clone git@github.com:stackpl/quickstart.git
- Then run:
-- cd quickstart
-- npm init
-- npm install mime
-- node server.js
-- open web browser and go to http://localhost

_________________________________________

# Download portable development tools

Git portable: https://git-scm.com/downloads
Example direct link: https://github.com/git-for-windows/git/releases/download/v2.10.1.windows.1/PortableGit-2.10.1-64-bit.7z.exe

Node.js portable: https://nodejs.org/dist 
Example direct link https://nodejs.org/dist/v6.9.1/node-v6.9.1-win-x64.zip

Visual Studio Code portable: https://code.visualstudio.com/Download
Example direct link https://code.visualstudio.com/docs/?dv=winzip
