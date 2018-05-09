# Vim

This documents how I primarily use vim. Custom configuration that you do not want
shared can go in `$HOME/.vimrc.local`.

## Plugins

I use [vim-plug](https://github.com/junegunn/vim-plug) as the plugin manager. When you
first start up vim, run `:PlugInstall` to get all the plugins.

## Useful Keybindings (native and my own)

This is not meant to be a comprehensive set of bindings; just the ones
that I find useful. For example, numbers can annotate almost any command
to repeat it that many times. I only list the repititions that I find
particularly useful.

Below, I will use the following to mean certain thigns:

- `<chr>` means any key
- `<C-f>` means `ctrl` and `f` at the same time
- `\N` means any number (e.g. repitition)
- `<leader>` means the leader key, which currently is the spacebar

### Movement

| Key Binding | Description                                         |
|:-----------:|:---------------------------------------------------:|
| `f + <chr>` | Moves cursor to next instance of that character     |
| `t + <chr>` | Moves cursor just before next instance of character |
| `F + <chr>` | Moves cursor to prev instance of that character     |
| `T + <chr>` | Moves cursor just before prev instance of character |
| `;`         | Repeats the previous `f` or `t` command             |
| `\N + j`    | Moves cursor down by N lines                        |
| `\N + k`    | Moves the cursor up by N lines                      |
| `w`         | Moves to next start of word                         |
| `e`         | Moves to next end of word                           |
| `b`         | Moves to previous start of word                     |
| `_`         | First non-empty character in line                   |
| `$`         | End of line                                         |
| `\N + G`    | Go to Nth line in file                              |
| `<C-f>`     | Page down                                           |
| `<C-b>`     | Page up                                             |
| `zz`        | Move screen so cursor is at center                  |
| `zt`        | Move screen so cursor is at top                     |
| `zb`        | Move screen so cursor is at bottom                  |
| `<C-e>`     | Move screen down without moving cursor              |
| `<C-y>`     | Move screen up without moving cursor                |
| `gg`        | First line in file                                  |
| `G`         | Last line in file                                   |

### Search

`*` searches forward for all occurences of the current word. `#` searches
backwards. These work in visual mode as well.

`/` enters search mode and searches forward. `?` searches backwards.

`n` goes to next occurence in direction of search. `N` goes to next occurence
in opposite direction.

### Search and Replace

`:s` is the search and replace command. It will perform search and replace on
the current line. `:%s` will perform search and replace on the whole file. In
visual mode, `:s` will perform search and replace on the selection.

`:.,+ns` will replace from current line down n lines. `:n1,n2s` will replace from
lines n1 to n2 inclusive.

The basic format of the command is `:s/<regex>/<replace>/<flags>`.

If using regex, I would recommend prepending the regex with `\v`. This means
that anything except `[a-zA-Z_]` has special meaning, so you don't need to escape
regex characters. If not using regex, I would prepend the regex field with `\V`.

The main flags are:

- `g` global (if this is omitted it will only change one occurence
- `i` ignore case
- `c` ask for confirmation before

0 or more flags can be used.

#### Examples

- `:%s/\V[foo]/bar/g` will replace the literal string `[foo]` with `bar` everywhere in the file.
- `:%s/\v[foo]/bar/gc` will replace all characters `f`, `o`, `o` with `bar` everywhere in the file
  but will ask for confirmation first (`[foo]` is treated as a regex).

### Window Management

`<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` have been remapped to move to the next
window in the left, up, down, and right direction respectively.

`<leader> + =` will resize all windows evenly throughout the terminal.

`<leader> + a`, `<leader> + s`, `<leader> + d`, `<leader> + f` will
horizontally shrink, vertically grow, vertically shorten, and
horizontally widen the current window respectively

`<leader> + <leader>` will close all other windows.

### Editing in Normal Mode

| Key Binding    | Description                                         |
|:--------------:|:---------------------------------------------------:|
| `x`            | Delete character                                    |
| `r + <chr>`    | Replace char under cursor with chr                  |
| `s`            | Delete character under cursor and enter insert mode |
| `a`            | Move cursor forward one and enter insert mode       |
| `I`            | Enter insert mode at start of line                  |
| `A`            | Start insert mode at end of line                    |
| `>>`           | Dedent line (useful with `\N` repitition)           |
| `<<`           | Dedent line (useful with `\N` repitition)           |
| `o`            | Create a new line below and enter insert mode       |
| `O`            | Create a new line above and enter insert mode       |
| `<leader> + O` | Create a new line below                             |
| `.`            | Repeat the last editor command                      |
| `u`            | Undo                                                |
| `<C-r>`        | Redo                                                |

### Yanking, Deleting, and Pasting

| Key Binding | Description                                         |
|:-----------:|:---------------------------------------------------:|
| `y`         | Yanks the text without modifying it                 |
| `d`         | Deletes the text                                    |
| `c`         | Deletes the text and puts you into insert mode      |
| `p`         | Put the text |

Note that all the above three commands can be run in visual mode in which case
it will just perform the action on the selected text. However, these
can also be used in normal mode, discussed below:

You can use `yy`, `dd`, or `cc` to perform the action on the current
line. Using this with reptition is quite useful.

You can follow `y`, `d`, or `c` with `iw` to perform the action on the
current word.

Note that `p` puts the most recently yanked, deleted, or changed item after the
cursor. `P` puts it before the cursor. If you want the most recently yanked
item (but not deleted or changed), you can use `<leader> + p` or `<leader> + P`
depending on if you want before or after.

`y`, `d`, and `c` can also be followed by one of the movements, in which case
the action will be performed from the current cursort to the result of the
movement (e.g. `d$` will delete from cursor to end of line).

### Visual Mode

There are 3 visual modes:

- `v` puts you into regular visual mode
- `V` puts you into line visual mode
- `<C-v>` puts you into block visual mode

When in visual mode, `O` toggles the cursor between current position and start/end
position. You can use the usual movement commands to highlight more/less text.

Yanking, deleting, and copying work in visual mode. Furthermore, `>` and `<` will
indent/dedent the selected text.

If on a Mac, `<C-cc>` will copy the selected text to clipboard.

In visual block mode, use `I` to get into insert mode. Modifications made on one line
will be propagated to all other lines when leaving insert mode (note you must use `<C-[>`
for this propagation; `<C-c>` will not work. You can also use `s` to remove and insert on
all lines.

### Insert Mode

`jk` has been mapped to `<C-[>` which leaves insert mode.

`<C-o>` leaves insert mode for one normal mode command and then re-enters insert mode.
This is useful if you just want to navigate to a different line, or different part
of the current line.

### Plugin Mappings


| Key Binding    | Description                                         |
|:--------------:|:---------------------------------------------------:|
| `<leader> + ]` | Jumps to definition or declaration                  |
| `<leader> + t` | Toggles tag bar which shows symbols in current file |
| `<C-n>`        | Toggles nerd tree, a file browser                   |
| `<C-p>`        | File fuzzy finder                                   |
| `<leader> + b` | File fuzzy finder for open buffers                  |

## Plugins

These are particularly useful plugins I have and how I use them.

### NerdTree

When in the NerdTree buffer:

| Key Binding    | Description                     |
|:--------------:|:-------------------------------:|
| `mm`           | Move the current file           |
| `md`           | Delete the current file         |
| `ma`           | Add a new file                  |
| `i`            | Open in hsplit screen           |
| `s`            | Open in vsplit screen           |
| `C`            | Change the current NerdTree dir |

`<leader> + n` will open the NerdTree highlighting the current file.

### Fzf

When in the fzf buffer (e.g. after `<C-p>` or `<leader> + b`), you can use `<enter>` to
open the file in the current window. Alternatively, you can use `<C-v>` to open a file in
a vsplit or `<C-x>` to open the file in an hsplit.

### A.vim

For editing C/C++ files, `:A` toggles between header and source file. `:AV` opens in vsplit and
`AS` opens in hsplit.

### Python bindings

`<leader>pd` will insert `import ipdb; ipdb.set_trace()` on the next line. `<leader>Pd` will do
it on the previous line.

`<leader>pp` will insert `from pprint import pprint as pp` on the next line. `<leader>Pp` will do
it on the previous line.
