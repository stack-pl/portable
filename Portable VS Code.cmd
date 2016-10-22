set cur_dir=%~dp0
set PATH=%cur_dir%node;%PATH%
set gitdir=%cur_dir%Git
set PATH=%gitdir%\cmd;%path%
start %cur_dir%VSCode\Code.exe