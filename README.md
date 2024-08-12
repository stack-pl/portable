# What it is?
'Portable Sandbox' is a set of development tools (for Windows) combined 
and configured as one independent folder. You can move this folder anywehere:
to another drive or even an another computer. Even that, all tools and projects in folder 'portable'
should works fine from new location.

# When I need it?
- You don't want install any application,
- You don't want use virtualization,
- You want to prepare a development environment that will be easy to copy,
  restore, reproduce, or share.

# How it works?
The entire tool is just a folder 'portable' that contains a little number of
scripts and also sub-folders dedicated for specified purposes. All settings 
for launching tools and building projects comes from script files located 
inside the Portable Sandbox and no instalation is required.

Folder structure:
   - [portable]
      -- [projects]  (working directory, sample projects)
         --- [gcc_sample] 
         --- [java_sample] 
         --- [node_sample]
         --- [python_sample]
         --- [r_sample]
         --- [rust_sample]
      -- [tools]  (editors, compilers, SCM, i.e)
         --- [gcc]
         --- [git]
         --- [java]
         --- [node]
         --- [python]
         --- [r]
         --- [rust]
         --- [vscode]
      -- bash-shell.cmd  (Git-bash terminal)
      -- cmd-shell.cmd  (Command Prompt CMD or Windows Terminal)
      -- ev.cmd (configuration script - this is the heart of Portable Sandbox)
      -- kill_ssh_agent  (close SSH Agent)
      -- start_ssh_agent  (launch SSH Agent)
      -- visual-studio-code.cmd (coVS Code launcher)
      -- visual-studio-code (bash script launcher for VS code)
      -- [.ssh]  (SSH configuration folder)
      -- [.gnupg]  (GnuPG configuration folder)

# How to start?
1. Download the last 'Portable Sandbox' release. The Archive 'portable.zip' 
   is available at https://stack.pl/portable 
   and also on github: https://github.com/stack-pl/portable

2. Unzip the archive you just downloaded in step 1 to your prefered location.
   That will be the Portable Sandbox base folder. For example it can be c:\portable.

3. Download and unpack the "Git for Windows portable".
   Application is availiable at https://git-scm.com/download/win.
   Unpack the archive into '.\portable\tools\git' sub-folder. 

4. Verify if Git is correctly unpacked.
   To do this:
   - launch script .\portable\bash-shell.cmd (XTerm window with Bash shell running should appear),
   - command 'git --version' should return a version number.

5. Download "VS Code" Zip archive version:
   https://code.visualstudio.com/#alt-downloads
   Direct link to the latest release: 
   https://code.visualstudio.com/docs/?dv=winzip
   Unpack downloaded file into '.\portable\tools\vscode' sub-folder.

6. Verify if VS Code is correctly unpacked.
   To do this:
   - launch script .\portable\visual-studio-code.cmd to run VS Code editor.

7. Depending of your needs, install another tools in '.\portable\tools' directory.
   Follow 'readme.txt' instructions in particular folders located in '.\portable\tools' to do so.
