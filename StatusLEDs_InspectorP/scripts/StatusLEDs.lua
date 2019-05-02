--[[----------------------------------------------------------------------------

  Application Name:
  StatusLEDs_InspectorP

  Summary:
  Alternating the result LED between different colors.

  How to Run:
  A connected InpspectorP device is necessary to run this sample. Starting this
  sample is possible either by running the app (F5) or debugging (F7+F10).
  The 'Result' LED cycles through the available colors.

  More Information:
  See the tutorial "Audio-visual Feedback InspectorP".

------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

--Array of available colors
local LED_COLORS = {'red', 'green', 'blue', 'fuchsia', 'yellow', 'aqua', 'white'}
local cycle = 0

-- Create 'Result' LED
local resultLED = LED.create('RESULT_LED')
print(resultLED)

local t = 1000 -- Cycle time in ms

--Create timer for cycle period
local tmr = Timer.create()
tmr:setExpirationTime(t)
tmr:setPeriodic(true)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  resultLED:activate()
  tmr:start()
end
Script.register('Engine.OnStarted', main)

local function handleOnExpired()
  cycle = cycle + 1
  --Cycle through the LED_COLORS array and setting the LED color
  if cycle <= rawlen(LED_COLORS) then
    resultLED:setColor(LED_COLORS[cycle])
    print(LED_COLORS[cycle])
  else
    cycle = 0
  end
end
tmr:register('OnExpired', handleOnExpired)

--End of Function and Event Scope-----------------------------------------------
