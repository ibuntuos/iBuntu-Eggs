DESKTOP=$(xdg-user-dir DESKTOP)
BASEDIR=$(dirname "$0")
# Create ~/Desktop just in case this runs before the xdg folder
test -f $BASEDIR/reboot.desktop && cp $BASEDIR/reboot.desktop $DESKTOP
test -f "$DESKTOP/reboot.desktop" && chown ibuntu "$DESKTOP/reboot.desktop"
test -f "$DESKTOP/reboot.desktop" && chmod a+x "$DESKTOP/reboot.desktop"
test -f "$DESKTOP/reboot.desktop" && gio set "$DESKTOP/reboot.desktop" metadata::trusted true

