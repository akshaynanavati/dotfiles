# Vim

## Plugins

I use [vim-plug](https://github.com/junegunn/vim-plug) as the plugin manager. When you
first start up vim, run `:PlugInstall` to get all the plugins.

## Useful Keybindings (native and my own)

Below, I will use the following to mean certain thigns:

- `<chr>` means any key
- `<C-f>` means `ctrl` and `f` at the same time
- `\N` means any number (e.g. repitition)

### Movement

| Key Binding | Description                                         | Native? |
|:-----------:|:---------------------------------------------------:|:-------:|
| `f + <chr>` | Moves cursor to next instance of that character     | Y       |
| `t + <chr>` | Moves cursor just before next instance of character | Y       |
| `;`         | Repeats the previous `f` or `t` command             | Y       |
| `\N + j`    | Moves cursor down by N lines                        | Y       |
| `\N + k`    | Moves the cursor up by N lines                      | Y       |
| `w`         | Moves to next start of word                         | Y       |
| `e`         | Moves to next end of word                           | Y       |
| `b`         | Moves to previous start of word                     | Y       |
| `_`         | First non-empty character in line                   | Y       |
| `$`         | End of line                                         | Y       |
| `\N + G`    | Go to Nth line in file                              | Y       |
| `<C-f>`     | Page down                                           | Y       |
| `<C-b>`     | Page up                                             | Y       |
| `zz`        | Move screen so cursor is at center                  | Y       |
| `zt`        | Move screen so cursor is at top                     | Y       |
| `zb`        | Move screen so cursor is at bottom                  | Y       |
| `<C-e>`     | Move screen down without moving cursor              | Y       |
| `<C-y>`     | Move screen up without moving cursor                | Y       |

### Editing in Normal Mode

| Key Binding | Description                                         | Native? |
|:-----------:|:---------------------------------------------------:|:-------:|
| `x`         | Delete character                                    | Y       |
| `t + <chr>` | Moves cursor just before next instance of character | Y       |
| `;`         | Repeats the previous `f` or `t` command             | Y       |
| `\N + j`    | Moves cursor down by N lines                        | Y       |
| `\N + k`    | Moves the cursor up by N lines                      | Y       |
| `w`         | Moves to next start of word                         | Y       |
| `e`         | Moves to next end of word                           | Y       |
| `b`         | Moves to previous start of word                     | Y       |
| `_`         | First non-empty character in line                   | Y       |
| `$`         | End of line                                         | Y       |
| `\N + G`    | Go to Nth line in file                              | Y       |
| `<C-f>`     | Page down                                           | Y       |
| `<C-b>`     | Page up                                             | Y       |
| `zz`        | Move screen so cursor is at center                  | Y       |
| `zt`        | Move screen so cursor is at top                     | Y       |
| `zb`        | Move screen so cursor is at bottom                  | Y       |
| `<C-e>`     | Move screen down without moving cursor              | Y       |
| `<C-y>`     | Move screen up without moving cursor                | Y       |
