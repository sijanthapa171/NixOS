# Keybindings Documentation

This document lists all keybindings defined in this configuration, grouped by context or plugin. Each table shows the mode(s), key, action, and a description if available.

---

## Core Keymaps (`config/core/keymaps.nix`)

| Mode(s)      | Key            | Action                                              | Description                                      |
|--------------|----------------|-----------------------------------------------------|--------------------------------------------------|
| v            | p              | "_dP                                                | Paste over currently selected text without yanking it |
| n            | <leader>sr     | :%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>      | Rename symbol with regex                         |
| n            | <C-s>          | <CMD>w<CR>                                          | Save file                                        |
| n            | <leader>qq     | <CMD>quitall<CR>                                    | Quit all                                         |
| n            | <leader>fy     | <CMD> %y <CR>                                       | Yank file contents                               |
| n            | <leader>fp     | <CMD> %d_<CR>Vp                                     | Paste file contents                              |
| n            | <ESC>          | <CMD>nohlsearch<CR>                                 |                                                  |
| n, t         | <C-k>          | <Cmd>wincmd k<CR>                                   | Cycle to top window                              |
| n, t         | <C-j>          | <Cmd>wincmd j<CR>                                   | Cycle to bottom window                           |
| n, t         | <C-l>          | <Cmd>wincmd l<CR>                                   | Cycle to right window                            |
| n, t         | <C-h>          | <Cmd>wincmd h<CR>                                   | Cycle to left window                             |
| n            | <leader>bd     | <CMD>bdelete<CR>                                    | Delete buffer                                    |
| n            | <A-k>          | <CMD>m .-2<CR>==                                    | Move text up                                     |
| n            | <A-j>          | <CMD>m .+1<CR>==                                    | Move text down                                   |
| v, x         | <A-k>          | <CMD>m '<-2<CR>gv=gv                               | Move text up                                     |
| v, x         | <A-j>          | <CMD>m '>+1<CR>gv=gv                               | Move text down                                   |
| x            | K              | <CMD>m '<-2<CR>gv=gv                               | Move text up                                     |
| x            | J              | <CMD>m '>+1<CR>gv=gv                               | Move text down                                   |
| n            | <leader>gg     | tmux new-window ... lazygit                         | Lazygit (Lua)                                    |
| n            | <leader>ac     | tmux split-window ...                               | Vertical Tmux Split (Lua)                        |

---

## Bufferline (`config/plugins/bufferline.nix`)

| Mode(s) | Key           | Action                              | Description                  |
|---------|---------------|-------------------------------------|------------------------------|
| n       | <S-l>         | <cmd>BufferLineCycleNext<cr>        | Cycle to next buffer         |
| n       | <S-h>         | <cmd>BufferLineCyclePrev<cr>        | Cycle to previous buffer     |
| n       | <leader>bo    | <cmd>BufferLineCloseOthers<cr>      | Delete other buffers         |
| n       | <leader>br    | <cmd>BufferLineCloseRight<cr>       | Delete buffers to the right  |
| n       | <leader>bl    | <cmd>BufferLineCloseLeft<cr>        | Delete buffers to the left   |
| n       | <leader>bp    | <cmd>BufferLineTogglePin<cr>        | Toggle pin                   |
| n       | <leader>bP    | <Cmd>BufferLineGroupClose ungrouped<CR> | Delete non-pinned buffers |

---

## Flash (`config/plugins/flash.nix`)

| Mode(s)   | Key     | Action                                         | Description           |
|-----------|---------|------------------------------------------------|-----------------------|
| n, x, o   | s       | <CMD>lua require('flash').jump()<CR>           | Flash                 |
| n, x, o   | S       | <CMD>lua require('flash').treesitter()<CR>     | Flash Treesitter      |
| o         | r       | <CMD>lua require('flash').remote()<CR>         | Remote Flash          |
| o, x      | R       | <CMD>lua require('flash').treesitter_search()<CR> | Treesitter Search  |
| c         | <A-s>   | <CMD>lua require('flash').toggle()<CR>         | Toggle Flash Search   |

---

## Format (`config/plugins/format.nix`)

| Mode(s) | Key         | Action                                                        | Description     |
|---------|-------------|---------------------------------------------------------------|-----------------|
| n       | <leader>fm  | <CMD>lua require('conform').format({ aync = true, lsp_fallback = true })<CR> | Format buffer   |

---

## Hop (`config/plugins/hop.nix`)

| Mode(s) | Key         | Action                                                                 | Description |
|---------|-------------|------------------------------------------------------------------------|-------------|
|         | <leader>hw  | <CMD>lua require('hop').hint_words()<CR>                               |             |
|         | <leader>hc  | <CMD>lua require('hop').hint_char2()<CR>                               |             |
|         | <leader>hl  | <CMD>lua require('hop').hint_lines_skip_whitespace()<CR>               |             |
|         | <leader>f   | <CMD>lua require('hop').hint_char1({ direction = ... AFTER_CURSOR ... })<CR> |        |
|         | <leader>F   | <CMD>lua require('hop').hint_char1({ direction = ... BEFORE_CURSOR ... })<CR> |       |
|         | <leader>t   | <CMD>lua require('hop').hint_char1({ direction = ... AFTER_CURSOR ... , hint_offset = -1 })<CR> | |
|         | <leader>T   | <CMD>lua require('hop').hint_char1({ direction = ... BEFORE_CURSOR ... , hint_offset = 1 })<CR> | |

---

## LSP (`config/plugins/lsp.nix`)

| Mode(s) | Key         | Action             | Description |
|---------|-------------|--------------------|-------------|
|         | <leader>k   | goto_prev          | Diagnostic: previous |
|         | <leader>j   | goto_next          | Diagnostic: next    |
|         | gd          | definition         | Goto definition     |
|         | gD          | declaration        | Goto declaration    |
|         | gi          | implementation     | Goto implementation |
|         | gr          | references         | Goto references     |
|         | gt          | type_definition    | Goto type definition|
|         | K           | hover              | Hover docs          |
|         | <C-k>       | signature_help     | Signature help      |
|         | <leader>ca  | code_action        | Code action         |
|         | <leader>rn  | rename             | Rename symbol       |
|         | <leader>wa  | add_workspace_folder| Add workspace folder|
|         | <leader>wr  | remove_workspace_folder| Remove workspace folder|

---

## Telescope (`config/plugins/telescope.nix`)

| Mode(s) | Key             | Action                | Description                |
|---------|-----------------|-----------------------|----------------------------|
|         | <leader><space> | find_files            | Find project files         |
|         | <leader>/       | live_grep             | Grep (root dir)            |
|         | <leader>:       | command_history       | Command History            |
|         | <leader>ff      | find_files            | Find project files         |
|         | <leader>fr      | oldfiles              | Find text                  |
|         | <leader>fR      | resume                | Resume                     |
|         | <leader>fg      | live_grep             | Recent                     |
|         | <leader>fb      | buffers               | Buffers                    |
|         | <C-p>           | git_files             | Search git files           |
|         | <leader>gc      | git_commits           | Commits                    |
|         | <leader>gs      | git_status            | Status                     |
|         | <leader>sa      | autocommands          | Auto Commands              |
|         | <leader>sb      | current_buffer_fuzzy_find | Buffer                 |
|         | <leader>sc      | command_history       | Command History            |
|         | <leader>sC      | commands              | Commands                   |
|         | <leader>sD      | diagnostics           | Workspace diagnostics      |
|         | <leader>sh      | help_tags             | Help pages                 |
|         | <leader>sH      | highlights            | Search Highlight Groups    |
|         | <leader>sk      | keymaps               | Keymaps                    |
|         | <leader>sM      | man_pages             | Man pages                  |
|         | <leader>sm      | marks                 | Jump to Mark               |
|         | <leader>so      | vim_options           | Options                    |
|         | <leader>sR      | resume                | Resume                     |
|         | <leader>cs      | colorscheme           | Colorscheme preview        |

---

## NvimTree (`config/plugins/nvimtree.nix`)

| Mode(s) | Key     | Action                        | Description |
|---------|---------|-------------------------------|-------------|
| n       | <C-n>   | <cmd>NvimTreeFindFileToggle<CR> |             |

---

## DAP (Debug Adapter Protocol) (`config/plugins/dap.nix`)

| Mode(s)         | Key         | Action/Function                        | Description                |
|-----------------|-------------|----------------------------------------|----------------------------|
| n, i, v, x      | <F17>       | dap.terminate()                        | Terminate debug session    |
| n, i, v, x      | <S-F5>      | dap.terminate()                        | Terminate debug session    |
| n, i, v, x, t   | <F5>        | dap.continue()                         | Start/continue debugging   |
| n               | <Leader>dt  | dapui.toggle()                         | Toggle DAP UI              |
| n               | <leader>b   | dap.toggle_breakpoint()                | Toggle breakpoint          |
| n               | <F10>       | dap.step_over()                        | Step over                  |
| n               | <F11>       | dap.step_into()                        | Step into                  |
| n               | <F12>       | dap.step_out()                         | Step out                   |
| i               | <F10>       | dap.step_over()                        | Step over (insert mode)    |
| i               | <F11>       | dap.step_into()                        | Step into (insert mode)    |
| i               | <F12>       | dap.step_out()                         | Step out (insert mode)     |
| n               | <Leader>dr  | dap.repl.open()                        | Open DAP REPL              |
| n               | <Leader>dl  | dap.run_last()                         | Run last debug session     |

---

## UFO (Folds) (`config/plugins/ufo.nix`)

| Mode(s) | Key   | Action                        | Description         |
|---------|-------|-------------------------------|---------------------|
| n       | zR    | require('ufo').openAllFolds   | Open all folds      |
| n       | zM    | require('ufo').closeAllFolds  | Close all folds     |
| n       | zK    | require('ufo').peekFoldedLinesUnderCursor or vim.lsp.buf.hover() | Peek Fold |

---

*Note: Some plugin keymaps may be contextually available only when the plugin is active or in certain filetypes.* 
