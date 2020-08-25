# dotfiles

Various dotfiles deployed using GNU Stow.

## Compton

### Desktop

I was seeing a lot of tearing, especially when watching videos in mpv.  Using compton fixes this.  On Mint I was using a [fork from yshui](https://github.com/yshui/compton/tree/master) as the original is no longer maintained.  I cloned `master` and built and installed it.  On Arch I'm just using `compton` from Community.

### ThinkPad

No tearing, don't need compton.

## yay update package count

`sudo visudo -f /etc/sudoers.d/pacman_update`

Add:
`jeff elbow = (root) NOPASSWD: /usr/sbin/pacman -Sy`
