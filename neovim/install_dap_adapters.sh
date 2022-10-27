dap_adapters_dir=~/.config/nvim/lua/conf/dap_adapters/


# C#
filename=netcoredbg-linux-amd64.tar.gz
wget "https://github.com/Samsung/netcoredbg/releases/latest/download/${filename}"
tar -xzf  ${filename} -C $dap_adapters_dir
rm -R ${filename}


# C++
filename=codelldb-x86_64-linux.vsix
wget "https://github.com/vadimcn/vscode-lldb/releases/latest/download/${filename}"
unzip ${filename} -d $dap_adapters_dir
rm -R ${filename}
find ${dap_adapters_dir} -maxdepth 1 -type f -delete
