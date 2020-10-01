settings {
	logfile = "/tmp/lsyncd.log",
	statusFile = "/tmp/lsyncd.status",
	nodaemon = true
}

sync {
	default.rsync,
	delay=3,
	source="/home/valde/Git/REPO",
	target="valde@94.126.6.138:/tmp/TARGET_DIR",
	rsync = { 
		rsh="/usr/bin/ssh -l valde -i /home/valde/.ssh/home -o StrictHostKeyChecking=no" 
	},
	exclude = {
		"node_modules",
		".git",
		".idea",
		"dist",
		".bloop",
		"target"
	}
}
