# ARCHIVED

The project [Build Info](https://github.com/djboni/build_info) superseeds
CVersion.


# [CVersion](https://github.com/djboni/cversion)

by Djones A. Boni


CVersion is a small library that helps you to keep track of your C/C++ projects
version information.
Version data fields: name, version, head commit, build number and build
datetime.

You can use CVersion both for closed- and open-source projects. You are also
free to keep changes to this library to yourself. However we'll enjoy your
improvements and suggestions.

You are free to copy, modify, and distribute CVersion with attribution under
the terms of the MIT License. See the LICENSE.txt file for details.


## Supported hardware

The project has been developed and tested with AVR microcontroller family
(ATmega 328P) using [Arduinutil](https://github.com/djboni/arduinutil) as
development platform.

However it should be very easy to port to another microcontroller family and
development platform.


## How CVersion works

There is one C header (data struct and macro declaration) and one C file (data
struct definition). These files must be added to the project.

The other files are shellscripts to manage the version information.

* `common.sh` Constants and functions definition. Used by other files.
* `init.sh` Create and initialize version information files.
* `setversion.sh` Change version in its information file.
* `prebuild.sh` Pre-build script. Updates build information.

In the `info` directory we will have the following files.

* `info/appname.val` C string with application name. **Defined by user**. Defaults
to empty string ("").
* `info/appheadpath.val` Path to the Git repository where to get the head commit
from, relative to project root directory. **Defined by user**. Defaults to project
root directory (.).
* `info/apphead.val` Git repository head commit. **Managed by pre-build script**.
* `info/appbuild.val` Build counter. **Managed by pre-build script**.
* `info/appbuildtime.val` Build date and time. **Managed by pre-build script**.
* `info/appversion.val` Application version. **Defined by user** using set-version script.

## How to use CVersion

1. CD to your project root
2. Clone CVersion repository
* `git clone https://github.com/djboni/cversion.git version`
3. Add CVersion directory to the include path
4. Add the project root directory to the include path
5. Create an `info` directory in the project root
* `mkdir info`
6. Enter CVersion directory and initialize version data, with project root
directory as its first argument. The `..` means parent directory, which is
project root.
* `cd version`
* `./init.sh ..`
7. Optional set your project version (don't forget the project root directory)
* `./setversion.sh .. 1 0 0`
8. You may also change `info/appname.val` and `info/appheadpath.val` with the
application name and the path to the Git repository where to get the head commit
from.
9. Test the pre-build script (don't forget the project root directory)
* `./prebuild.sh ..`
10. Configure IDE to run the pre-build scrit before compiling. This is the
command that works for me (... project root directory)
* Linux `cd ../version && ./prebuild.sh ..`
* Windows `"C:\Program Files\Git\bin\bash.exe" -c "cd ../version && ./prebuild.sh .."`

Now every time you build the build counter is incremented, the build time is
updated and the head commit is also updated.

You may define the macro `APPNAME` in your IDE to change the data structure
name.

The compiler will probably optimize out (remove) the struct if the application
does not use it.

## Code example

Below there is a CVersion example in an AVR project using
[Arduinutil](https://github.com/djboni/arduinutil) as development platform in an
AVR project.

```c
#include "version.h"
#include "Arduinutil.h"
#include <avr/pgmspace.h>
#include <string.h>

void print_version(const struct cversion_t *progmem_data)
{
    struct cversion_t data;

    memcpy_P(&data, progmem_data, sizeof(data));

    Serial_write("Name: ");
    Serial_write(data.name);
    Serial_write("\n");

    Serial_write("Version: ");
    Serial_print("%u.", (data.version >> 24) & 0xFF);
    Serial_print("%u.", (data.version >> 16) & 0xFF);
    Serial_print("%u.", (data.version >> 8) & 0xFF);
    Serial_print("%u ", (data.version) & 0xFF);
    Serial_write(data.head);
    Serial_write("\n");

    Serial_write("Build: ");
    Serial_print("%lu ", data.build);
    Serial_write(data.datetime);
    Serial_write("\n");

    Serial_write("\n");
}

int main(void)
{
    init();
    Serial_begin(9600, SERIAL_8N1);

    print_version(&App);

    while(1) {}
}

```

## Important files

[README.md](https://github.com/djboni/cversion/blob/master/README.md)
Fast introduction (this file).

[LICENCE.txt](https://github.com/djboni/cversion/blob/master/LICENCE.txt)
Complete license text.
