# goto
goto tool for linux

### TODO

* Change -h response, more info and -f flag

#### New flags :

##### Open file by specified name
```
goto -f "filename"
```
- More intelligent way of searching (Include paths to libraries, SDKs etc...)

##### Open docker container by specified SW part number name - temporary only - needs work for a long run
```
goto -c "SW part number"
```
- Find way to be more env independent

* Add installation script (installation from working directory)

Use this for self delete:
```
#!/bin/bash
tmpscript="$0"

function finish {
    echo "Securely shredding ${tmpscript}"; shred -u ${tmpscript};
}

trap finish EXIT
```

#### To add

goto -g option : goto specific git repository ?

goto <tab><tab> : implement completion
see :
* [unix.stack](https://unix.stackexchange.com/questions/4219/how-do-i-get-bash-completion-for-command-aliases)
* [iridakos](https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial)
* How to stop Powershell from resetting [WSL console font](https://patrickwu.space/2019/08/03/wsl-powershell-raster-font-problem/)
