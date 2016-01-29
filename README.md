To create symlinks for all dotfiles:

```
$ git clone https://github.com/modustri/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ make 
```

Include the individual config files you want in your `~/.gitconfig`

```
[include]
  path = ~/.gitconfig-core
  path = ~/.gitconfig-aliases
  # path = ~/.gitconfig-diff
[user]
  name = Brian Steketee
  email = brian.steketee@modustri.com

# Any other config can be added
[alias]
  pr = !zsh -ic open-pr
```

To apply future updates:

```
$ cd ~/.dotfiles
$ git pull
$ make
```
