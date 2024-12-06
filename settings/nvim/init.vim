inoremap jk <ESC>
inoremap JK <ESC>

map ,c gg"*yG
map ,p ggdG"*p 

map ,g :%s^br />^br>^gIe <bar> :%s^<div>^\r<div>^gIe <bar> :%s^<div>\s*<br></div>^<br>^ge <bar> :%s^<br>\s\+<br>^<br><br>^gIe <bar> :%s^<br>\s\+<br>^<br><br>^gIe <bar> :%s^<br>\([A-Za-z0-9&*$\-/]\\|<a\\|<div\\|\s-\\|\s\+[A-Z]\)^<br>\r\1^gIe <bar> :%s^</div><div>^</div>\r<div>^gIe <bar> :%s^</li><li>^</li>\r<li>^gIe <bar> :%s^&nbsp;&nbsp;^\&nbsp; ^gIe <bar> :%s^<br>\([{#\-]\)^<br>\r\1^gIe <bar> :%s^}}^}<wbr>}^gec <bar> :norm! ggO<wbr><CR>

set nu
set relativenumber

" For Anki Cards - Add `Qn: ` and `Ans: ` to the file
" The following command cannot be improved upon to ignore `Qn: ` and `Ans: `
" The Ignore command works directly on the prompt, but not in the map.
" Hence, the 'Ans' and 'Tags' substition only looks for lines with a space before them.
map ,ac :%s/\(\n\n\n\n\)\([^Qn: ]\)/\1Qn: \2/c <bar> :%s^\(\n\n\)\([^\nQ]\)^\1Ans: \2^c <bar> :%s^\(\n\n\)\([^\nQA]\)^\1Tags: \2^c <bar> :noh <CR>
