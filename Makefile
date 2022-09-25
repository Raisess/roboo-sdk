PROJECT_NAME=main

LIBRARIES=./libraries

BOARD=esp8266:esp8266
BOARD_TYPE=nodemcuv2

PORT=/dev/ttyUSB0
BAUD_RATE=9600

build:
	arduino-cli compile --fqbn $(BOARD):$(BOARD_TYPE) --libraries $(LIBRARIES) $(PROJECT_NAME)

build-test:
	arduino-cli compile --fqbn $(BOARD):$(BOARD_TYPE) --libraries $(LIBRARIES) test

upload:
	sudo chmod 666 $(PORT)
	arduino-cli upload -p $(PORT) --fqbn $(BOARD):$(BOARD_TYPE) $(PROJECT_NAME)

upload-test:
	sudo chmod 666 $(PORT)
	arduino-cli upload -p $(PORT) --fqbn $(BOARD):$(BOARD_TYPE) test

init:
	arduino-cli config init

install:
	arduino-cli core update-index
	arduino-cli core install $(BOARD)

boards:
	arduino-cli board list

serial:
	sudo chmod 666 $(PORT)
	picocom -b $(BAUD_RATE) $(PORT)
