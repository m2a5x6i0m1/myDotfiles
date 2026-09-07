-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- hyprsunset -t 3500")
	hl.exec_cmd("uwsm app -- awww-daemon && awww restore")
	hl.exec_cmd("uwsm app -- qs")

	--- Polkit
	hl.exec_cmd("uwsm app -- systemctl --user start hyprpolkitagent")

	--- Clipboard Support
	hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
	hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store")

	--- Clipboard History
	hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")

	--- Clipboard Persistense
	hl.exec_cmd("uwsm app -- wl-clip-persist --clipboard regular")
end)
