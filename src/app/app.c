#include "app/app.h"

#include <stdbool.h>
#include <stdint.h>

#include "inc/hw_memmap.h"
#include "driverlib/gpio.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include "driverlib/sysctl.h"

#include "dbg/dbg.h"

#define LED_RED GPIO_PIN_1
#define LED_BLUE GPIO_PIN_2
#define LED_GREEN GPIO_PIN_3

struct App
{
	bool initialized;
	bool running;
} app;

void appInit()
{
	MAP_SysCtlClockSet(SYSCTL_SYSDIV_4
		| SYSCTL_USE_PLL
		| SYSCTL_XTAL_16MHZ 
		| SYSCTL_OSC_MAIN);
	MAP_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
	MAP_GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, 
		LED_RED | LED_BLUE | LED_GREEN);

	app.initialized = true;
}

void appRun()
{
	dbgCheck(false);
	app.running = true;

	while(true)
	{
		MAP_GPIOPinWrite(GPIO_PORTF_BASE, 
			LED_RED | LED_GREEN | LED_BLUE, 
			LED_GREEN);
		MAP_SysCtlDelay(5000000);
		MAP_GPIOPinWrite(GPIO_PORTF_BASE, 
			LED_RED | LED_GREEN | LED_BLUE, 
			0);
		MAP_SysCtlDelay(5000000);
	}

	app.running = false;
}

/**
 * @brief [brief description]
 * @details [long description]
 * 
 * @param pcFilename [description]
 * @param ui32Line [description]
 */
void
__error__(char *pcFilename, uint32_t ui32Line)
{
	(void)pcFilename;
	(void)ui32Line;

	while(true)
	{
	}
}
