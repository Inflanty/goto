# goto
goto tool for linux

### TODO

* Change -h response, more info and -f flag

* New flag :
```
goto -f "filename"
```
- Two or more files exception add

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
