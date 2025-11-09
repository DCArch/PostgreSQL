#include "postgres.h"
#include "commands/defrem.h"
#include <stdio.h>

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(dcsim_start_simulation);
PG_FUNCTION_INFO_V1(dcsim_end_simulation);

// Global ROI start and end
static inline void DCSimStartGlobalROI()
{
    // Create a multi byte NOP with a special operand: FEED BEEF
    __asm__ __volatile__
    (
        ".byte 0x0F, 0x1F, 0x80, 0xEF, 0xBE, 0xED, 0xFE ;\n\t"
        :
        :
        : "memory"
    );
}

static inline void DCSimEndGlobalROI()
{
    // Create a multi byte NOP with a special operand: DEAD BEEF
    __asm__ __volatile__
    (
        ".byte 0x0F, 0x1F, 0x80, 0xEF, 0xBE, 0xAD, 0xDE ;\n\t"
        :
        :
        : "memory"
    );
}

Datum
dcsim_start_simulation(PG_FUNCTION_ARGS) {
    elog(NOTICE, "DCSim: Starting simulation");
    DCSimStartGlobalROI();
    PG_RETURN_VOID();
}

Datum
dcsim_end_simulation(PG_FUNCTION_ARGS) {
    elog(NOTICE, "DCSim: Ending simulation");
	DCSimEndGlobalROI();
    PG_RETURN_VOID();
}
