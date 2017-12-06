# Tiva CMake seed
_CMake-based seed project to develop applications for TI Tiva series microcontrollers using GCC_

## Features
- (at the moment) support only for TI TM4C123GH6PM microcontroller
- out-of-source build system using _CMake_
- (at the moment) support for code written in _C_ language
- uses _OpenOCD_ and _GDB_ to debug MCU
- uses _LM4Flash_ to write application into MCU
- useful CMake targets like _debug_, _release_, _flash_

## How to use
### Needed software:
- _arm-none-eabi_ - minimum version 5.4.1
- _LM4Flash_ - minimum version 0.1.3
- _OpenOCD_ - minimum version 0.10.0
- _TI TivaWare_ - minimum version 2.1.4.178
- _CMake_ - minimum version 3.5.1
- Any Linux based OS

Installation process of these software is described well in [Chris Miller post](http://chrisrm.com/howto-develop-on-the-ti-tiva-launchpad-using-linux/). 
CMake can be installed e.g. by `apt install cmake`

### Pre-configuration
_I assumed, that tivaware library is placed in `/opt/embedded/tivaware` directory_

1. First, make place for TivaWare library files in `/usr/local/include` and `/usr/local/lib`:
```bash
    sudo mkdir /usr/local/include/tivaware
    sudo mkdir /usr/local/lib/tivaware
```
2. Copy Hardware-specific includes:
```bash
    sudo cp -r /opt/embedded/tivaware/inc/ /usr/local/include/tivaware/
```
3. Copy DriverLib includes:
```bash
    sudo mkdir /usr/local/include/tivaware/driverlib
    sudo cp /opt/embedded/tivaware/driverlib/*.h /usr/local/include/tivaware/driverlib/
```
4. Copy DriverLib compiled library
```bash
    sudo mkdir /usr/local/lib/tivaware
    sudo cp /opt/embedded/tivaware/driverlib/gcc/libdriver.a /usr/local/lib/tivaware
```
    
### Building application for MCU
1. Clone this repository and enter it:
```bash
    git clone git@github.com:akowalew/tiva-cmake-seed.git
    cd tiva-cmake-seed
```
2. Create build directory
    - Debug version
    ```bash
        mkdir build-debug
        cd build-debug
        cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/tm4c123.cmake -DCMAKE_BUILD_TYPE=DEBUG
    ```
    - Release version
    ```bash
        mkdir build-release
        cd build-release
        cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/tm4c123.cmake -DCMAKE_BUILD_TYPE=RELEASE
    ```
3. Compile all
```bash
    make
```
4. Run binary in MCU
    - Only flash into Tiva
    ```bash
        make flash
    ```
    - Flash and run Debug session with GDB
    ```bash
        make debug
    ```
    - Flash and run Release session with GDB
    ```bash
        make release
    ```
