# Vimium Configuration

## Location

Browser Extension Settings

## Configuration

### Excluded URLs & Keys Pattern

```
unmap f
unmap F
unmap j
unmap k

map u LinkHints.activateMode
map U LinkHints.activateModeToOpenInNewTab

map j scrollPageDown
map k scrollPageUp
map <C-j> scrollFullPageDown
map <C-k> scrollFullPageUp

map p togglePinTab

unmap <a-p>
map <C-m> toggleMuteTab
```

### Custom key mappings

```
https?://www.youtube.com/*/
https?://mail.google.com/*
https?://www.247sudoku.com/*
https?://www.udemy.com/*
```

![](./Vimium%20-%20settings.png)

#### Notes

- Youtube is on the list because it interferes with Playback speed controls (Shift + <>)
- f and F have been unmapped because many sites use f and F to go full screen (JioCinema, Youtube, PrimeVideo)
- 247sudoku just does not work with this plugin.
- Alt + Keys do not work
