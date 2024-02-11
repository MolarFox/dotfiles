function ssh_aloadkeys
	set GPG_TTY $(tty)
	export GPG_TTY

	eval (ssh-agent -c)
	ssh-add (cat ~/.ssh/_autoload)
end
