" Language: OpenGL Shading Language
" Maintainer: Sergey Tikhomirov <sergey@tikhomirov.io>

" Extensions supported by Khronos reference compiler (with one exception, ".glsl")
" https://github.com/KhronosGroup/glslang
au BufNewFile,BufRead *.fsh,*.vsh set filetype=glsl | set autoread

" vim:set sts=2 sw=2 :
