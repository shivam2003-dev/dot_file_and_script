# DevOps Dotfiles

A comprehensive dotfiles setup for DevOps engineers including configurations for Neovim, Tmux, and Zsh.

## Quick Start

```bash
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles
./install.sh
```

## Features

### Neovim Configuration
- Plugin management with vim-plug
- LSP support for various languages
- Git integration with fugitive and gitgutter
- File explorer with NERDTree
- Fuzzy finding with FZF

#### Key Shortcuts
- `,n` - Toggle NERDTree
- `,f` - Fuzzy file search
- `,t` - Open terminal
- `,g` - Open Git status
- `,d` - Show documentation hover
- `gd` - Go to definition

#### DevOps-Specific Features
- Terraform syntax highlighting and auto-formatting
- YAML/JSON formatting
- Dockerfile syntax support
- Ansible playbook syntax highlighting
- Kubernetes manifest validation

### Tmux Configuration
- Prefix key: `Ctrl-a`
- Mouse support enabled
- Vim-style pane navigation

#### Key Shortcuts
- `Ctrl-a |` - Split pane vertically
- `Ctrl-a -` - Split pane horizontally
- `Ctrl-a h/j/k/l` - Navigate panes (vim style)
- `Alt + Arrow Keys` - Navigate panes
- `Ctrl-a r` - Reload tmux config
- `Ctrl-a c` - Create new window
- `Ctrl-a n` - Next window
- `Ctrl-a p` - Previous window
- `Ctrl-a ,` - Rename window
- `Ctrl-a .` - Move window
- `Ctrl-a z` - Zoom pane
- `Ctrl-a [` - Copy mode (vim keys)

### Zsh Configuration
- Oh-My-Zsh with robbyrussell theme
- Auto-suggestions and syntax highlighting
- DevOps-focused plugins (git, docker, kubectl, etc.)

### Included Aliases and Tools

#### Git
- `g` - git
- `ga` - git add
- `gc` - git commit
- `gp` - git push
- `gl` - git pull
- `gst` - git status
- `gd` - git diff
- `gco` - git checkout
- `gb` - git branch

#### Docker
- `d` - docker
- `dc` - docker-compose
- `dps` - docker ps
- `di` - docker images
- `dex` - docker exec -it
- `dl` - docker logs
- `drm` - docker rm
- `drmi` - docker rmi

#### Kubernetes
- `k` - kubectl
- `kg` - kubectl get
- `kd` - kubectl describe
- `kl` - kubectl logs
- `ka` - kubectl apply -f
- `kdel` - kubectl delete
- `kc` - kubectl config
- `kns` - kubectl config set-context --current --namespace

#### Terraform
- `tf` - terraform
- `tfi` - terraform init
- `tfp` - terraform plan
- `tfa` - terraform apply
- `tfd` - terraform destroy
- `tfw` - terraform workspace

#### AWS
- `awsl` - aws configure list
- `awsp` - aws configure list-profiles

### Font Installation
The setup includes JetBrainsMono Nerd Font, which provides:
- Clear monospace font with programming ligatures
- DevIcons support for NERDTree
- Powerline symbols for status bars
- Extra glyphs for development

## Rollback
If you need to restore your previous configuration:
```bash
./rollback.sh
```

## Customization
- Neovim configuration: `~/.config/nvim/init.vim`
- Tmux configuration: `~/.tmux.conf`
- Zsh configuration: `~/.zshrc`
- Custom aliases: `~/.config/aliases.sh`

## Recommended Tools

### Development
- [httpie](https://httpie.io/) - Modern curl alternative
- [jq](https://stedolan.github.io/jq/) - JSON processor
- [yq](https://github.com/mikefarah/yq) - YAML processor
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder

### DevOps
- [kubectx](https://github.com/ahmetb/kubectx) - Kubernetes context switcher
- [helm](https://helm.sh/) - Kubernetes package manager
- [k9s](https://k9scli.io/) - Kubernetes CLI UI
- [aws-vault](https://github.com/99designs/aws-vault) - AWS credentials manager
- [terraform-docs](https://terraform-docs.io/) - Terraform documentation generator