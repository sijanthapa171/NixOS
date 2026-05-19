hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "1280x1024@60",
	position = "240x1080",
	scale = 1,
	transform = 1,
})
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@60",
	position = "1280x0",
	scale = 1,
})
hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "1280x1080",
	scale = 1,
})

-- Binds workspaces to my monitors (find desc with: hyprctl monitors)
hl.workspace_rule({ workspace = "1", persistent = true, monitor = "desc:BNQ BenQ EL2870U PCK00489SL0", default = true })
hl.workspace_rule({ workspace = "2", persistent = true, monitor = "desc:BNQ BenQ EL2870U PCK00489SL0" })
hl.workspace_rule({ workspace = "3", persistent = true, monitor = "desc:BNQ BenQ EL2870U PCK00489SL0" })
hl.workspace_rule({ workspace = "4", persistent = true, monitor = "desc:BNQ BenQ EL2870U PCK00489SL0" })
hl.workspace_rule({ workspace = "5", persistent = true, monitor = "desc:BNQ BenQ EW277HDR 99J01861SL0", default = true })
hl.workspace_rule({ workspace = "6", persistent = true, monitor = "desc:BNQ BenQ EW277HDR 99J01861SL0" })
hl.workspace_rule({ workspace = "7", persistent = true, monitor = "desc:BNQ BenQ EW277HDR 99J01861SL0" })
hl.workspace_rule({ workspace = "8", persistent = true, monitor = "desc:BNQ BenQ xl2420t 99D06760SL0", default = true })
hl.workspace_rule({ workspace = "9", persistent = true, monitor = "desc:BNQ BenQ xl2420t 99D06760SL0" })
hl.workspace_rule({ workspace = "10", persistent = true, monitor = "desc:BNQ BenQ EL2870U PCK00489SL0" })
