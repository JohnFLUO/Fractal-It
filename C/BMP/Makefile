TARGET 		= fractal

CC 			= g++

CFLAGS 		= -W# -O3 -Wall -fopenmp

LINKER 		= g++ -o

LFLAGS 		= -Wall -O3 -I. -fopenmp

SRCDIR 		= src
OBJDIR 		= obj
BINDIR 		= bin

SOURCES 	:= $(wildcard $(SRCDIR)/*.cpp)
INCLUDES 	:= $(wildcard $(SRCDIR)/*.h)
OBJECTS 	:= $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
rm 			= rm -f

all: $(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(OBJECTS)
	@$(LINKER) $@ $(OBJECTS) $(LFLAGS)

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	@$(rm) $(OBJECTS)

.PHONY: remove
remove: clean
	@$(rm) $(BINDIR)/$(TARGET)
