-- http://nodemcu.readthedocs.io/en/master/en/modules/rotary/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--


	----------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------	Rotary Module	----------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------
local Rotary = ...			-- Obtain a sample value from somewhere
local Rotary_Module =  {}	-- conRotary an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[Rotary] = Rotary_Module	--	A global variable (not a function) that holds the global environment

function Rotary_Module()
--[[	rotary.setup()	-	Initialize the nodemcu to talk to a rotary encoder switch.
	Syntax		-	rotary.setup(channel, pina, pinb(, pinpress(, longpress_time_ms(, dblclick_time_ms))))
	Parameters	-	channel The rotary module supports three switches. The channel is either 0, 1 or 2.
					pina This is a GPIO number (excluding 0) and connects to pin phase A on the rotary switch.
					pinb This is a GPIO number (excluding 0) and connects to pin phase B on the rotary switch.
					pinpress (optional) This is a GPIO number (excluding 0) and connects to the press switch.
					longpress_time_ms (optional) The number of milliseconds (default 500) of press to be considered a long press.
					dblclick_time_ms (optional) The number of milliseconds (default 500) between a release and a press for the next release to be considered a double click.
	Returns		-	Nothing. If the arguments are in error, or the operation cannot be completed, then an error is thrown.
					For all API calls, if the channel number is out of range, then an error will be thrown.
	Example		-	rotary.setup(0, 5,6, 7)
]]--
end

function Rotary_Module()
--[[	rotary.on()		-	Sets a callback on specific events.
	Syntax		-	rotary.on(channel, eventtype[, callback])
	Parameters	-	channel The rotary module supports three switches. The channel is either 0, 1 or 2.
					eventtype This defines the type of event being registered. This is the logical or of one or more of PRESS, LONGPRESS, RELEASE, TURN, CLICK or DBLCLICK.
					callback This is a function that will be invoked when the specified event happens.
					If the callback is None or omitted, then the registration is cancelled.

					The callback will be invoked with three arguments when the event happens. The first argument is the eventtype, the second is the current position of the rotary switch, and the third is the time when the event happened.

					The position is tracked and is represented as a signed 32-bit integer. Increasing values indicate clockwise motion. The time is the number of microseconds represented in a 32-bit integer. Note that this wraps every hour or so.
	Example

			rotary.on(0, rotary.ALL, function (type, pos, when) 
				print "Position=" .. pos .. " event type=" .. type .. " time=" .. when
			end)

	Notes
			Events will be delivered in order, but there may be missing TURN events. If there is a long queue of events, then PRESS and RELEASE events may also be missed. Multiple pending TURN events are typically dispatched as one TURN callback with the final position as its parameter.

			Some switches have 4 steps per detent. This means that, in practice, the application should divide the position by 4 and use that to determine the number of clicks. It is unlikely that a switch will ever reach 30 bits of rotation in either direction -- some are rated for under 50,000 revolutions.

			The CLICK and LONGPRESS events are delivered on a timeout. The DBLCLICK event is delivered after a PRESS, RELEASE, PRESS, RELEASE sequence where this is a short time gap between the middle RELEASE and PRESS.
	Errors
		If an invalid eventtype is supplied, then an error will be thrown.
]]--
end

function Rotary_Module()
--[[	rotary.getpos()		-	Gets the current position and press status of the switch
	Syntax		-	pos, press, queue = rotary.getpos(channel)
	Parameters	-	channel The rotary module supports three switches. The channel is either 0, 1 or 2.
	Returns		-	pos The current position of the switch.
					press A boolean indicating if the switch is currently pressed.
					queue The number of undelivered callbacks (normally 0).
	Example		-	print rotary.getpos(0)
]]--
end

function Rotary_Module()	
--[[	rotary.close()	-	Releases the resources associated with the rotary switch.
	Syntax		-	rotary.close(channel)
	Parameters	-	channel The rotary module supports three switches. The channel is either 0, 1 or 2.
	Example		-	rotary.close(0)
]]--
end


return Rotary_Module