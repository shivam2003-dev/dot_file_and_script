# DevOps Dotfiles Cheatsheet

## Quick Reference

### Vim/Neovim Commands
```
Basic Commands:
:w          - Save file
:q          - Quit
:wq         - Save and quit
:q!         - Quit without saving
dd          - Delete line
yy          - Copy line
p           - Paste after cursor
P           - Paste before cursor
u           - Undo
Ctrl + r    - Redo

Navigation:
h,j,k,l     - Left, down, up, right
w           - Next word
b           - Previous word
0           - Start of line
$           - End of line
gg          - Start of file
G           - End of file
```

### Custom Vim Shortcuts
```
,n          - Toggle NERDTree
,f          - Fuzzy file search
,t          - Open terminal
,g          - Open Git status
,d          - Show documentation hover
gd          - Go to definition
```

### Tmux Commands
```
Basic Commands:
Ctrl-a c    - Create new window
Ctrl-a w    - List windows
Ctrl-a n    - Next window
Ctrl-a p    - Previous window
Ctrl-a &    - Kill window

Pane Management:
Ctrl-a |    - Split vertically
Ctrl-a -    - Split horizontally
Ctrl-a x    - Kill pane
Ctrl-a z    - Toggle zoom
Ctrl-a arrows - Resize panes

Navigation:
Ctrl-a h/j/k/l   - Navigate panes (vim-style)
Alt + arrows     - Navigate panes
Ctrl-a q         - Show pane numbers
```

### Git Shortcuts
```
Basic Commands:
g           - git
ga          - git add
gc          - git commit
gp          - git push
gl          - git pull
gst         - git status
gd          - git diff
gco         - git checkout
gb          - git branch

Advanced Git:
gfa         - git fetch --all
grhh        - git reset --hard HEAD
gsta        - git stash
gstp        - git stash pop
glog        - git log --oneline --decorate --graph
```

### Docker Shortcuts
```
Basic Commands:
d           - docker
dc          - docker-compose
dps         - docker ps
di          - docker images
dex         - docker exec -it
dl          - docker logs
drm         - docker rm
drmi        - docker rmi

Common Tasks:
dprune      - docker system prune -a
dstats      - docker stats
dtop        - docker top
dinspect    - docker inspect
```

### Kubernetes Shortcuts
```
Basic Commands:
k           - kubectl
kg          - kubectl get
kd          - kubectl describe
kl          - kubectl logs
ka          - kubectl apply -f
kdel        - kubectl delete
kc          - kubectl config
kns         - kubectl config set-context --current --namespace

Resource Management:
kgp         - kubectl get pods
kgs         - kubectl get services
kgn         - kubectl get nodes
kgd         - kubectl get deployments
```

### Terraform Shortcuts
```
Basic Commands:
tf          - terraform
tfi         - terraform init
tfp         - terraform plan
tfa         - terraform apply
tfd         - terraform destroy
tfw         - terraform workspace

Advanced Commands:
tfv         - terraform validate
tff         - terraform fmt
tfs         - terraform show
tfst        - terraform state
```

### AWS CLI Shortcuts
```
Basic Commands:
awsl        - aws configure list
awsp        - aws configure list-profiles
aws-who     - aws sts get-caller-identity

Common Tasks:
aws-regions - aws ec2 describe-regions
aws-azs     - aws ec2 describe-availability-zones
```

## Development Tools

### HTTPie
```bash
# Basic usage
http GET example.com
http POST example.com foo=bar
http -v example.com  # Verbose output

# Authentication
http -a username:password example.com
http example.com 'Authorization: Bearer token'
```

### jq (JSON processor)
```bash
# Basic filtering
cat file.json | jq '.property'
cat file.json | jq '.items[]'

# Complex queries
jq '.items[] | select(.name == "example")'
jq '.items[] | {name: .name, id: .id}'
```

### yq (YAML processor)
```bash
# Read YAML
yq eval '.property' file.yaml
yq eval '.items[].name' file.yaml

# Convert YAML to JSON
yq eval -o=json file.yaml
```

## DevOps Tools

### kubectx/kubens
```bash
# Switch context
kubectx my-cluster

# Switch namespace
kubens my-namespace

# Show current context
kubectx -c
```

### Helm
```bash
# Repository management
helm repo add [name] [url]
helm repo update

# Chart operations
helm install [release] [chart]
helm upgrade [release] [chart]
helm rollback [release] [revision]
```

### k9s
```bash
# Start k9s
k9s

# Common shortcuts in k9s
:pod        - List pods
:deploy     - List deployments
:svc        - List services
ctrl-d      - Delete resource
ctrl-k      - Kill pod
/           - Start filtering
```

### aws-vault
```bash
# Add profile
aws-vault add profile-name

# Execute command with profile
aws-vault exec profile-name -- aws s3 ls

# Login to console
aws-vault login profile-name
```

### terraform-docs
```bash
# Generate markdown docs
terraform-docs markdown table .

# Generate JSON docs
terraform-docs json .
```

## Font Installation

The dotfiles setup uses JetBrainsMono Nerd Font for optimal rendering of icons and symbols. The font is automatically installed during setup, but you can manually install it:

1. Download the font:
```bash
curl -fLo "/tmp/JetBrainsMono.zip" \
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
```

2. Install the font:
```bash
unzip "/tmp/JetBrainsMono.zip" -d ~/.local/share/fonts/
fc-cache -fv
```

## Customization Tips

### Adding Custom Aliases
Add your aliases to `~/.config/aliases.sh`:
```bash
# Example custom alias
alias myalias='custom-command'
```

### Adding Vim Plugins
Edit `~/.config/nvim/plugins.vim`:
```vim
" Add new plugin
Plug 'username/plugin-name'
```
Then run `:PlugInstall` in Neovim.

### Adding Tmux Settings
Edit `~/.tmux.conf`:
```bash
# Example custom binding
bind-key M-x kill-pane
```

### Adding Zsh Plugins
Edit `~/.zshrc`:
```bash
plugins=(
  # Add new plugin here
  new-plugin
  ${plugins[@]}
)
```
