function ssh_aloadkeys
	eval (ssh-agent -c)
	ssh-add (cat ~/.ssh/_autoload)
end
