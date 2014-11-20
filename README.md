mbed
====

mbed lpc1768 projects

##Installing the mbed library and tools on linux
#### libusb-0.1 seems to already be installed, and pyOCD will attempt to use it, but it doesn't seem to be able to capture the interface.
    sudo apt-get install libusb-1.0-0
#### Do not pip install pyusb. It seems to want a version of libusb > 1.0.16
    git clone https://github.com/walac/pyusb
#### pyOCD needs libusb >= 1.0.0 and a pyusb that will work with that version.
    git clone https://github.com/mbedmicro/pyOCD
#### mbed libraries sources to build library objects
    git clone https://github.com/mbedmicro/mbed
