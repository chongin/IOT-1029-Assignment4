ifdef DEBUG
    DEBUGFLAGS = -g
else
    DEBUGFLAGS =
endif

TARGET  := a.out
SRC     := $(wildcard *.s)
OBJS    := $(SRC:%.s=%.o)

$(TARGET): $(OBJS)
	arm-none-eabi-ld -o $(TARGET) $(OBJS)

%.o: %.s
	arm-none-eabi-as $(DEBUGFLAGS) $< -o $@

clean:
	-@rm $(TARGET)
	-@rm $(OBJS)

