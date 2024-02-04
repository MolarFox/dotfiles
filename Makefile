CONFIG = ./home/.config/

.PHONY: pull_all pull_root pull_home pull_config populate_all populate_root populate_config warn_populate clean

help:
	@echo "pull_all to pull dotfiles in your system into this folder for git committing. populate_all to send dotfiles in this folder out to your system"

pull_all: pull_root pull_home
	git status

pull_root:
	mkdir -p ./root/; \
	sudo cp /root/arch_aur_packages.txt ./root/;	\
	sudo cp /root/arch_packages.txt ./root/;		\

pull_home: pull_config
	cp $(HOME)/.gitconfig ./home/

pull_config:
	mkdir -p $(CONFIG); \
	cp -r $(HOME)/.config/cherrytree	$(CONFIG);	\
	cp -r $(HOME)/.config/cura			$(CONFIG);	\
	cp -r $(HOME)/.config/fish			$(CONFIG);	\
	cp -r $(HOME)/.config/i3 			$(CONFIG);	\
	cp -r $(HOME)/.config/sway 			$(CONFIG);	\
	cp -r $(HOME)/.config/swayidle		$(CONFIG);	\
	cp -r $(HOME)/.config/systemd 		$(CONFIG);	\
	cp -r $(HOME)/.config/waybar 		$(CONFIG);	\

populate_all: warn_populate populate_root populate_config

populate_root: warn_populate
	cp -r ./root/* /root

# populate_home: warn_populate
# 	cp ./home/.gitconfig $(HOME)/.gitconfig

populate_config: warn_populate
	cp -r $(CONFIG)* $(HOME)/.config/

warn_populate:
	@read -p "[!] This will overwrite dotfiles in your system. You should run 'make clean' and then delete unwanted dotfiles locally in this folder before proceeding. Continue? [y/N]: " populate_resp;	\
	if [ "$$populate_resp" != "y" ] ; then exit 1 ; fi

clean:
	rm -rf ./home;	\
	sudo rm -rf ./root;\
	git restore .