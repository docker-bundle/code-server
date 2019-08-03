@echo off
set DIR=/%CD%
set DIR=%DIR:\=/%
set DIR=%DIR::=%
set HOME=/%USERPROFILE%
set HOME=%HOME:\=/%
set HOME=%HOME::=%

docker run -it --rm -w "%DIR%"^
                    -v "%DIR%:%DIR%"^
                    -v "%HOME%/.ssh:/root/.ssh"^
                    -v //var/run/docker.sock:/var/run/docker.sock^
                    -v code-server-vscode:/home/vscode^
                    -v code-server-home:/root^
                    -p 127.0.0.1:8443:8443^
                    --entrypoint dumb-init^
                    dockerbundle/code-server code-server -e /home/vscode/extensions -d /home/vscode/user_data -H -N "%DIR%"
