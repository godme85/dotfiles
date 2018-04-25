syntax on " Para la sintaxis en cualquier lenguaje que reconozca
filetype indent plugin on " Indentación en los archivos, según su extensión
set shiftwidth=4 " Para darle a la indentación un tamanio de 4 espacios
set nocompatible

" Para mostrar números relativos al renglón actual, y el número
" de la línea actual
set nu relativenumber

set path+=** " Busca un archivo en subcarpetas al usar el comando find.
set wildmenu " Busca y muestra una lista de archivos al usar
	     " :find y una sub-cadena :3

"Permite crear el archivo tags. Y tambien permite autocompletar 
command! MakeTags !ctags -R .

" Inserta plantilla html
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>4jwf>a

" Permite activar la corrección ortográfica
map <F6> :setlocal spell! spelllang=es<CR>

" Permite ejecutar una orden escrita dentro de nuestro archivo de texto
" y de esta manera, el regreso lo escriba en el archivo (Presionar Q)
:noremap Q !!$SHELL<CR>

" Presentación en Sent
map <F8> :w!<CR>:!sent <c-r>%<CR><CR>

""" Chaconeado del .vimrc de Luke Smith:

" Navegando con guías <++>
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

" Abrir un pdf de este archivo LaTeX o markdown
autocmd FileType tex map <leader>p :!mupdf <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>
autocmd FileType tex map -p :!xreader <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>
autocmd FileType markdown,rmd map <leader>p :!mupdf <c-r>%<backspace><backspace>pdf &<CR><CR>
autocmd FileType markdown,rmd map -p :!xreader <c-r>%<backspace><backspace>pdf &<CR><CR>

" Compilar markdown a pdf (texto)
autocmd FileType markdown,rmd map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%<backspace><backspace>pdf<space>-V<space>geometry:margin=1in<space>-V<space>fontsize=12pt<space>--template=mytemplate.latex<space>--latex-engine=xelatex<Enter><Enter>
" Compilar markdown a pdf (presentación)
autocmd FileType markdown,rmd map <F7> :!pandoc<space><C-r>%<space>-o<space><C-r>%<backspace><backspace>pdf<space>--latex-engine=xelatex<space>--template=mytemplate.beamer<space>-t<space>beamer<Enter><Enter>

" Compilar LaTeX a pdf (f5 para pdflatex f7 para xelatex)
autocmd FileType tex map <F5> :!pdflatex<space><c-r>%<CR><CR>
autocmd FileType tex map <F7> :!xelatex<space><c-r>%<CR><CR>
