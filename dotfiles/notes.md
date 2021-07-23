# Notes

## Turn auto complete on for Mac Terminal

To turn on autocomplete in Mac Terminal do the following steps:

1. Open up the terminal

2. Enter the command `sudo nano ~/.inputrc` and enter password when prompted

3. Paste the following commands one at a time

```
    set completion-ignore-case on
    set show-all-if-ambiguous on
    TAB: menu-complete
```

4. Hit control+O to save changes to .inputrc followed by control+X to exit nano

(Ref: https://medium.com/@timleland/how-to-enable-autocomplete-in-mac-terminal-f3480678e829)
