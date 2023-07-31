for f in split(glob('~/.config/nvim/init.d/*.vim'), '\n')
    exec 'source' f
endfor

for l in split(glob('~/.config/nvim/lua.d/*.lua'), '\n')
    exec 'luafile' l
endfor

for p in split(glob('~/.config/nvim/python.d/*.py'), '\n')
    exec 'pyfile' p
endfor
