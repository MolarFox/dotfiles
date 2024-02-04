.PHONY: all root home config

# HOME = ${HOME}
CONFIG = ./home/.config/

all: root home

root:
	sudo cp -r /root/ ./

home: config
	cp $(HOME)/.gitconfig ./home/

config:
	mkdir -p $(CONFIG); \
	cp -r $(HOME)/.config/cherrytree	$(CONFIG);	\
	cp -r $(HOME)/.config/cura			$(CONFIG);	\
	cp -r $(HOME)/.config/fish			$(CONFIG);	\
	cp -r $(HOME)/.config/i3 			$(CONFIG);	\
	cp -r $(HOME)/.config/sway 			$(CONFIG);	\
	cp -r $(HOME)/.config/swayidle		$(CONFIG);	\
	cp -r $(HOME)/.config/systemd 		$(CONFIG);	\
	cp -r $(HOME)/.config/waybar 		$(CONFIG);	\
