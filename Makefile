CONFIGDIR=/etc
RULESDIR=/etc/udev/rules.d
HWDBDIR=/etc/udev/hwdb.d

build: 95-keymap-apple-kdb.rules

95-keymap-apple-kdb.rules: 95-keymap-apple-kdb.rules.in
	sed -e 's%@CONFIGDIR@%${CONFIGDIR}%' $< > $@

install:
	install -d $(CONFIGDIR) $(RULESDIR)
	install -m 644 apple-kbd $(CONFIGDIR)
	install -m 644 95-keymap-apple-kdb.rules $(RULESDIR)
	install -m 644 95-apple-kbd.hwdb $(HWDBDIR)

uninstall:
	-rm -f $(CONFIGDIR)/apple-kbd
	-rm -f $(RULESDIR)/95-keymap-apple-kdb.rules
	-rm -f $(HWDBDIR)/95-apple-kbd.hwdb

clean:
	-rm -f 95-keymap-apple-kdb.rules *~

.PHONY: build install uninstall clean
