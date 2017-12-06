/**
 * dbg.h
 * Contains declarations for dbg module
 * Author: akowalew
 */

#pragma once

#include <stdint.h>
#include <stdbool.h>

void dbgCheckFailed(char *pcFilename, uint32_t ui32Line);

#ifndef NDEBUG
#define dbgCheck(expr) \
	do                                                       \
	{                                                        \
		if(!(expr))                                          \
		{                                                    \
			dbgCheckFailed(__FILE__, __LINE__);                \
	    }                                                    \
	}                                                        \
	while(false)
#else
#define dbgCheck(expr)
#endif