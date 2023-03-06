setlocal textwidth=120
setlocal colorcolumn=+1
setlocal list
setlocal shiftwidth=4
setlocal expandtab
setlocal spell
setlocal nonu
setlocal norelativenumber
setlocal nolist

PackerLoad mkdx

nnoremap m2h :!pandoc % -o %.html<cr>
