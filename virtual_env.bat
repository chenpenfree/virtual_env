REM ****************************批处理自动安装python环境******************************

REM 获取后续要用到的两个路径(>nul:表示执行结果不返回)
@echo on
set pa=%~dp0
cd /d "%pa%"
cd ../../../../../../
set pe=%CD%
@echo ************************************* >> virtual_env_log.txt
@echo %date:~0,10%-%time:~0,8 >> virtual_env_log.txt

REM 检查虚拟环境的完整性，生成的install_flag.txt文件中保存安装参数，0表示安装成功，-1，-2,-3,-4。。。表示出错环节
if not exist install_flag.txt (goto run0)
for /f %%i in (install_flag.txt) do (set var=%%i)
@echo %var% >> virtual_env_log.txt
if %var% equ 1 (goto run1)

if exist "%pe%\testenv_name" (rd /s /q "%pe%\testenv_name")

:run0
