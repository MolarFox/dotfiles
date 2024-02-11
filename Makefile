CONFIG = ./home/.config/
LOCAL_BIN = ./home/.local/bin

.PHONY: pull_all pull_root pull_home pull_config populate_all populate_root populate_config warn_populate clean

help:
	@echo "pull_all to pull dotfiles in your system into this folder for git committing. populate_all to send dotfiles in this folder out to your system"

pull_all: pull_home
	git status

pull_root:
	mkdir -p ./root/; \
	sudo cp /root/arch_aur_packages.txt ./root/;	\
	sudo cp /root/arch_packages.txt ./root/;		\

pull_home: pull_config pull_local_bins
	cp $(HOME)/.gitconfig ./home/

pull_config:
	mkdir -p $(CONFIG); \
	cp -r $(HOME)/.config/cherrytree	$(CONFIG);	\
	cp -r $(HOME)/.config/fish			$(CONFIG);	\
	cp -r $(HOME)/.config/i3 			$(CONFIG);	\
	cp -r $(HOME)/.config/sway 			$(CONFIG);	\
	cp -r $(HOME)/.config/swayidle		$(CONFIG);	\
	cp -r $(HOME)/.config/systemd 		$(CONFIG);	\
	cp -r $(HOME)/.config/waybar 		$(CONFIG);	\
	cp -r $(HOME)/.config/rclone/		$(CONFIG);	\

# NB: These may be your sensitive custom scripts. Don't wildcard these.
pull_local_bins:
	mkdir -p $(LOCAL_BIN); \
	cp -r $(HOME)/.local/bin/swaybg_random.sh	$(LOCAL_BIN);	\


populate_all: warn_populate populate_config populate_local_bins

# Since this should just be first-boot utils, this isn't updated during populate_all by default
populate_root: warn_populate
	cp -r ./root/* /root

populate_config: warn_populate
	cp -r $(CONFIG)* $(HOME)/.config/

populate_local_bins: warn_populate
	cp -r $(LOCAL_BIN)* $(HOME)/.local/bin/

warn_populate:
	@read -p "[!] This will overwrite dotfiles in your system. You should run 'make clean' and then delete unwanted dotfiles locally in this folder before proceeding. Continue? [y/N]: " populate_resp;	\
	if [ "$$populate_resp" != "y" ] ; then exit 1 ; fi

clean:
	rm -rf ./home;	\
	sudo rm -rf ./root;\
	git restore .