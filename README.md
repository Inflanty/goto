# goto
goto tool for linux

### TODO
Change -h response, more info
Add installation script (installation from working directory)

Use this for self delete:
```
#!/bin/bash
tmpscript="$0"

function finish {
    echo "Securely shredding ${tmpscript}"; shred -u ${tmpscript};
}

trap finish EXIT
```
