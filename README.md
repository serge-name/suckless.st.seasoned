# st.seasoned

Build my own patched version of [Suckless Terminal](https://st.suckless.org)

Used patches:

* [bold-is-not-bright](https://st.suckless.org/patches/bold-is-not-bright/)
* [themed_cursor](https://st.suckless.org/patches/themed_cursor/) (updated)
* [vertcenter](https://st.suckless.org/patches/vertcenter/)
* [xresources](https://st.suckless.org/patches/xresources/)

Build steps:

```shell
apt install -y build-essential quilt libx11-dev x11proto-core-dev libxft-dev libxcursor-dev
make install
```
