self: super:
{
  neovim = super.neovim.override {
    configure = {
      customRC = ''
      set number
      set background=dark
      colorscheme solarized
      if !exists("g:ycm_semantic_triggers")
       let g:ycm_semantic_triggers = {}
       endif
      let g:ycm_semantic_triggers['typescript'] = ['.']
      let mapleader = ' '
      nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
      nnoremap <Leader>jr :YcmCompleter GoToReferences<CR>
      nnoremap <Leader>gt :YcmCompleter GetType<CR>

      " move between windows easier
      nnoremap <C-h> <C-w><C-h>
      nnoremap <C-j> <C-w><C-j>
      nnoremap <C-k> <C-w><C-k>
      nnoremap <C-l> <C-w><C-l>
      " move from the neovim terminal window to somewhere else
      tnoremap <C-h> <C-\><C-n><C-w>h
      tnoremap <C-j> <C-\><C-n><C-w>j
      tnoremap <C-k> <C-\><C-n><C-w>k
      tnoremap <C-l> <C-\><C-n><C-w>l

      " highlight trailing whitespace in red
      highlight ExtraWhitespace ctermbg=red guibg=red
      match ExtraWhitespace /\s\+$/

      " esc clears search highlight
      nnoremap <esc> :let @/ = ""<return>

      " automatically enter insert mode in terminal windows
      autocmd WinEnter term://* startinsert

      " exit terminal mode easier
      tnoremap <esc> <C-\><C-n>

      " mouse support
      set mouse=a

      " tabs/spaces - the only correct way
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set expandtab

      set backup
      set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
      set backupskip=/tmp/*,/private/tmp/*
      set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
      set writebackup
      set backupcopy=yes " this makes sure file watchers notice when vim writes to a file

      "set statusline to show git information
      set statusline=%f%m%r%h%w\ %{fugitive#statusline()}\ %{&ff}\ %Y\ %04l\ %04v\ %l\ %p%%

      "stop tsuquyomi from importing overly deep import paths, use the shortest available
      let g:tsuquyomi_shortest_import_path = 1

      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0

      let g:syntastic_typescript_checkers = ['tslint']

      " The below lints files matching the path with the supplied linting json config file via syntastic. Remove or edit to match your projects as required.
      autocmd BufNewFile,BufRead /home/jordan/Documents/front-end/* let g:syntastic_typescript_tslint_args = "-c /home/jordan/Documents/front-end/tslint.json"

      " let fugitive show results in the quickfix window properly
      autocmd QuickFixCmdPost *grep* cwindow
      '';

      vam.pluginDictionaries = [
        {
          names = [ "tsuquyomi"
                    "syntastic"
                    "vimproc"
                    "typescript-vim"
                    "rust-vim"
                    "The_NERD_Commenter"
                    "fugitive"
                    "Solarized" ];
        }
      ];
    };
  };
}
