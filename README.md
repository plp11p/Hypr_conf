**Required packages:**

- **Terminal:** ghostty  
- **Shell:** zsh *(optional: fzf, bat)*  
- **Editor:** neovim  
- **Notification daemon:** mako  
- **Bar:** waybar  
- **App launcher:** wofi  
- **File manager:** yazi  
- **Bluetooth manager:** blueman  
- **Screenshot tools:** slurp + grim  
- **Resource monitor:** btop  
- **Blue light filter:** wlsunset  
- **Image viewer:** imv  
- **Video player:** celluloid  

```bash
sudo pacman -S fzf blueman ghostty zsh neovim wlsunset bat imv celluloid mako slusp grim waybar wofi btop yazi
```

___
**Download**

```bash
git clone https://github.com/plp11p/Hypr_conf && mv Hypr_conf/* .config/ -f
```
___
**Make GTK Theme**
```bash
paru -S catppuccin-gtk-theme-mocha

#or

yay -S catppuccin-gtk-theme-mocha
```
