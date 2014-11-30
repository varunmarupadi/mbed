# This file was automagically generated by mbed.org. For more information, 
# see http://mbed.org/handbook/Exporting-to-GCC-ARM-Embedded

DEBUG = 1
GCC_BIN = ${which arm-none-eabi-gcc | xargs dirname}
PROJECTS = TalkSerial gray minimal_flash
OBJECTS = ./TalkSerial.o 
SYS_OBJECTS = ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/cmsis_nvic.o ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/system_LPC17xx.o ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/board.o ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/retarget.o ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/startup_LPC17xx.o 
INCLUDE_PATHS = -I. -I./mbed -I./mbed/TARGET_LPC1768 -I./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM -I./mbed/TARGET_LPC1768/TARGET_NXP -I./mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X -I./mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X/TARGET_MBED_LPC1768 
LIBRARY_PATHS = -L./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM 
LIBRARIES = -lmbed 
LINKER_SCRIPT = ./mbed/TARGET_LPC1768/TOOLCHAIN_GCC_ARM/LPC1768.ld

############################################################################### 
AS      = $(GCC_BIN)arm-none-eabi-as
CC      = $(GCC_BIN)arm-none-eabi-gcc
CPP     = $(GCC_BIN)arm-none-eabi-g++
LD      = $(GCC_BIN)arm-none-eabi-gcc
OBJCOPY = $(GCC_BIN)arm-none-eabi-objcopy

CPU = -mcpu=cortex-m3 -mthumb
CC_FLAGS = $(CPU) -c -g -fno-common -fmessage-length=0 -Wall -fno-exceptions -ffunction-sections -fdata-sections -fomit-frame-pointer -fno-rtti
CC_FLAGS += -MMD -MP
CC_SYMBOLS = -DTARGET_LPC1768 -DTARGET_M3 -DTARGET_NXP -DTARGET_LPC176X -DTARGET_MBED_LPC1768 -DTOOLCHAIN_GCC_ARM -DTOOLCHAIN_GCC -D__CORTEX_M3 -DARM_MATH_CM3 -DMBED_BUILD_TIMESTAMP=1416424294.46 -D__MBED__=1 

LD_FLAGS = -mcpu=cortex-m3 -mthumb -Wl,--gc-sections --specs=nano.specs -u _printf_float -u _scanf_float
LD_SYS_LIBS = -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys

ifeq ($(DEBUG), 1)
  CC_FLAGS += -DDEBUG -O0
else
  CC_FLAGS += -DNDEBUG -Os
endif

all: $(addsuffix .bin, $(PROJECTS))

clean:
	rm -f *.bin *.elf *.o $(DEPS)

.s.o:
	$(AS) $(CPU) -o $@ $<

.c.o:
	$(CC)  $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu99   $(INCLUDE_PATHS) -o $@ $<

.cpp.o:
	$(CPP) $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu++98 $(INCLUDE_PATHS) -o $@ $<

.cc.o:
	$(CPP) $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu++98 $(INCLUDE_PATHS) -o $@ $<


%.elf: %.o $(SYS_OBJECTS)
	$(LD) $(LD_FLAGS) -T$(LINKER_SCRIPT) $(LIBRARY_PATHS) -o $@ $^ $(LIBRARIES) $(LD_SYS_LIBS) $(LIBRARIES) $(LD_SYS_LIBS)

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

DEPS = $(OBJECTS:.o=.d) $(SYS_OBJECTS:.o=.d)
-include $(DEPS)
