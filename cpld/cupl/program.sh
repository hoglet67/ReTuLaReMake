#!/bin/bash
openocd -f /usr/local/share/openocd/scripts/interface/ftdi/um232h.cfg -c "adapter_khz 400" -c "transport select jtag" -c "jtag newtap ATF1508AS tap -irlen 3 -expected-id 0x0150803f" -c init -c "svf tube.svf" -c "sleep 200" -c shutdown
