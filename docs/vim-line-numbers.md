# Relative and Absolute line stuff
## https://jeffkreeftmeijer.com/vim-number/

## Abs

```
" turn absolute line numbers on
:set number
:set nu

" turn absolute line numbers off
:set nonumber
:set nonu

" toggle absolute line numbers
:set number!
:set nu!
```

## Relative

```
" turn relative line numbers on
:set relativenumber
:set rnu

" turn relative line numbers off
:set norelativenumber
:set nornu

" toggle relative line numbers
:set relativenumber!
:set rnu!
```

# Hybrid

```
" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" turn hybrid line numbers off
:set nonumber norelativenumber
:set nonu nornu

" toggle hybrid line numbers
:set number! relativenumber!
:set nu! rnu!
```

# Auto - This is sick

```
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
```
