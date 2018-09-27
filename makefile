# Order Invoice - Images v1.0 - https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=35204
# Copyright 2018 Burkatskyi Andrii aka underr
# Licensed under MIT - https://raw.githubusercontent.com/underr-ua/ocmod3-order-invoice-images/master/LICENSE.txt

zip=$(shell basename `pwd`).ocmod.zip

license=LICENSE.txt
readme=README.md
datetime=201801010000.00
src=src
bin=bin


all: clean makedir timestamp makezip

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(license)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(license)"
	@rm -f "$(src)/$(readme)"
