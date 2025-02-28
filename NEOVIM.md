# Neovim Documentation

## Quick Reference

### Basic Commands
```
:w          - Save file
:q          - Quit
:wq or :x   - Save and quit
:q!         - Quit without saving
:e file     - Edit file
:sp         - Split window horizontally
:vsp        - Split window vertically
```

### Navigation
```
h,j,k,l     - Left, down, up, right
w           - Next word
b           - Previous word
e           - End of word
0           - Start of line
$           - End of line
gg          - Start of file
G           - End of file
```

### Text Manipulation
```
dd          - Delete line
yy          - Copy line
p           - Paste after cursor
P           - Paste before cursor
u           - Undo
Ctrl + r    - Redo
>>          - Indent line
<<          - Unindent line
```

## NERDTree Commands

### Basic Usage
```
,n          - Toggle NERDTree (custom mapping)
o           - Open file/directory
t           - Open in new tab
s           - Open in vertical split
i           - Open in horizontal split
```

### File Operations in NERDTree
```
m           - Show NERDTree menu
a           - Add new file/directory
d           - Delete file/directory
r           - Refresh NERDTree
R           - Refresh root
```

### Navigation in NERDTree
```
P           - Jump to root
p           - Jump to parent
K           - Jump to first child
J           - Jump to last child
Ctrl+j      - Jump to next sibling
Ctrl+k      - Jump to previous sibling
```

### View Options
```
I           - Toggle hidden files
f           - Toggle file filters
F           - Toggle files
B           - Toggle bookmarks
```

## Advanced Features

### Split Management
```
Ctrl+w h    - Move to left split
Ctrl+w j    - Move to bottom split
Ctrl+w k    - Move to top split
Ctrl+w l    - Move to right split
Ctrl+w =    - Make splits equal size
Ctrl+w _    - Maximize height
Ctrl+w |    - Maximize width
```

### Code Navigation
```
gd          - Go to definition
gr          - Go to references
gi          - Go to implementation
gy          - Go to type definition
K           - Show documentation
```

### Search and Replace
```
/pattern    - Search forward
?pattern    - Search backward
n           - Next search result
N           - Previous search result
:%s/old/new/g   - Replace in whole file
:s/old/new/g    - Replace in current line
```

### Buffer Management
```
:ls         - List buffers
:b number   - Go to buffer by number
:bn         - Next buffer
:bp         - Previous buffer
:bd         - Delete buffer
```

### Code Folding
```
zf          - Create fold
za          - Toggle fold
zo          - Open fold
zc          - Close fold
zR          - Open all folds
zM          - Close all folds
```

## Language Support Features

### Python
- Autocompletion via CoC
- Code formatting
- Import sorting
- Type checking
- Function signatures
- Documentation on hover

### JavaScript/TypeScript
- Autocompletion
- ES6+ syntax support
- React/JSX support
- Import/export suggestions
- Type information

### Java
- Maven/Gradle support
- Autocompletion
- Project structure
- Error detection
- Quick fixes

### YAML/JSON
- Schema validation
- Formatting
- Structure validation
- Autocompletion

### C/C++
- Autocompletion
- Header file switching
- Symbol search
- Include management

## DevOps-Specific Features

### Git Integration
```
:Git        - Git status
:Git diff   - Show changes
:Git blame  - Show blame
:Git log    - Show log
```

### Docker/Kubernetes Support
- Syntax highlighting for Dockerfiles
- YAML validation for Kubernetes manifests
- Autocompletion for docker-compose
- Live template snippets

### Terraform/Infrastructure as Code
- HCL syntax highlighting
- Resource autocompletion
- Provider suggestions
- Format on save

### Configuration Files
- Advanced YAML support
- JSON schema validation
- Ansible playbook validation
- Environment variable highlighting

## Custom Shortcuts

### File Operations
```
,f          - Fuzzy find files
,t          - Open terminal
```

### Project Navigation
```
,n          - Toggle NERDTree
Ctrl+p      - Quick file search
gd          - Jump to definition
Ctrl+o      - Jump back
```

## Tips and Tricks

### Efficiency Tips
1. Use marks to quickly jump between locations
   ```
   ma        - Set mark 'a'
   'a        - Jump to mark 'a'
   ```

2. Record and play macros
   ```
   qa        - Start recording macro 'a'
   q         - Stop recording
   @a        - Play macro 'a'
   ```

3. Use registers for complex operations
   ```
   "ay       - Yank into register 'a'
   "ap       - Paste from register 'a'
   ```

### Common DevOps Workflows

1. **Quick File Editing**
   ```
   ,n        - Open NERDTree
   Ctrl+p    - Quick file search
   gd        - Jump to definition
   Ctrl+o    - Jump back
   ```

2. **Configuration Management**
   ```
   :set ft=yaml  - Set filetype to YAML
   :set ft=json  - Set filetype to JSON
   gg=G         - Auto-indent entire file
   ```

3. **Log Analysis**
   ```
   /ERROR      - Search for errors
   :sort       - Sort lines
   :g/pattern/ - List all matches
   ```

## Debugging and Development

### Terminal Integration
```
,t          - Open terminal
:term       - Open terminal in new buffer
:vert term  - Open terminal in vertical split
```

### Code Diagnostics
```
:checkhealth    - Run Neovim diagnostics
:messages       - Show message history
:scriptnames    - List loaded scripts
:verbose map ,n - Show mapping source
```

### Plugin Management
```
:PlugInstall    - Install plugins
:PlugUpdate     - Update plugins
:PlugClean      - Remove unused plugins
:PlugStatus     - Check plugin status
```

Remember to run `:checkhealth` periodically to ensure all features are working correctly and language servers are properly configured.