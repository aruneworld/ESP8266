-- http://nodemcu.readthedocs.io/en/master/en/modules/coap/

--[[
http://esp8266iot.blogspot.in/
http://aruneworld.blogspot.com/
https://github.com/adalurarun/Embedded_System/MicroController/Espressif/ESP8266
Copyright Arun 2016-2017
MIT License

If you like this project, please add a star!
]]--


-----------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------                    CoAP Module ------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------
local ModuleName = ...			-- Obtain a sample value from somewhere
local CoAP_Module =  {}	-- construct an empty table and assign it to variable "Table_name" (ex: local Arun =  {})
_G[ModuleName] = CoAP_Module	--	A global variable (not a function) that holds the global environment 


--[[The CoAP module provides a simple implementation according to CoAP protocol. The basic endpoint server part is based on microcoap, and many other code reference libcoap.

This module implements both the client and the server side. GET/PUT/POST/DELETE is partially supported by the client. Server can register Lua functions and variables. No observe or discover supported yet.

Caution

	This module is only in the very early stages and not complete yet.
	Constants	Constants for various functions.
	coap.Client()	Creates a CoAP client.
	coap.Server()	Creates a CoAP server.
	coap.client:get()	Issues a GET request to the server.
	coap.client:put()	Issues a PUT request to the server.
	coap.client:post()	Issues a POST request to the server.
	coap.client:delete()	Issues a DELETE request to the server.
	coap.server:listen()	Starts the CoAP server on the given port.
	coap.server:close()	Closes the CoAP server.
	coap.server:var()	Registers a Lua variable as an endpoint in the server.
	coap.server:func()	Registers a Lua function as an endpoint in the server.
]]--

function CoAP_Module.coap.CON()
--[[	Constants - Constants for various functions.

	coap.CON, coap.NON represent the request types.

	coap.TEXT_PLAIN, coap.LINKFORMAT, coap.XML, coap.OCTET_STREAM, coap.EXI, coap.JSON represent content types.
]]--
end

function CoAP_Module.Client()
--[[	coap.Client()	-	Creates a CoAP client.
	Syntax		-	coap.Client()
	Parameters	-	none
	Returns		-	CoAP client
	Example			cc = coap.Client()
					-- assume there is a coap server at ip 192.168.100
					cc:get(coap.CON, "coap://192.168.18.100:5683/.well-known/core")
					-- GET is not complete, the result/payload only print out in console.
					cc:post(coap.NON, "coap://192.168.18.100:5683/", "Hello")
]]--
end

function CoAP_Module.Server()
--[[		coap.Server()	-	Creates a CoAP server.
		Syntax		-	coap.Server()
		Parameters	-	none
		Returns		-	CoAP server
		Example		-- use copper addon for firefox
					cs=coap.Server()
					cs:listen(5683)
					myvar=1
					cs:var("myvar") -- get coap://192.168.18.103:5683/v1/v/myvar will return the value of myvar: 1
					all='[1,2,3]'
					cs:var("all", coap.JSON) -- sets content type to json

	-- function should tack one string, return one string.
	function myfun(payload)
	  print("myfun called")
	  respond = "hello"
	  return respond
	end
	cs:func("myfun") -- post coap://192.168.18.103:5683/v1/f/myfun will call myfun
]]--
end
			-------------------------------------------------------------------------------------------------------
			------------------------------------------ // CoAP Client // ------------------------------------------
			-------------------------------------------------------------------------------------------------------
function CoAP_Module.client:get(type, uri[, payload])
--[[	coap.client:get()		-	Issues a GET request to the server.
	Syntax		-	coap.client:get(type, uri[, payload])
	Parameters	-	type coap.CON, coap.NON, defaults to CON. If the type is CON and request fails, the library retries four more times before giving up.
					uri the URI such as "coap://192.168.18.103:5683/v1/v/myvar", only IP addresses are supported i.e. no hostname resoltion.
					payload optional, the payload will be put in the payload section of the request.
	Returns		-	nil
]]--
end

function CoAP_Module.client:put(type, uri[, payload])
--[[	coap.client:put()	-	Issues a PUT request to the server.
	Syntax		-	coap.client:put(type, uri[, payload])
	Parameters	-	type coap.CON, coap.NON, defaults to CON. If the type is CON and request fails, the library retries four more times before giving up.
					uri the URI such as "coap://192.168.18.103:5683/v1/v/myvar", only IP addresses are supported i.e. no hostname resoltion.
					payload optional, the payload will be put in the payload section of the request.
	Returns		-	nil
]]--
end

function CoAP_Module.client:post(type, uri[, payload])
--[[	coap.client:post()	-	Issues a POST request to the server.
	Syntax		-	coap.client:post(type, uri[, payload])
	Parameters	-	type coap.CON, coap.NON, defaults to CON. when type is CON, and request failed, the request will retry another 4 times before giving up.
					uri the uri such as coap://192.168.18.103:5683/v1/v/myvar, only IP is supported.
					payload optional, the payload will be put in the payload section of the request.
	Returns		-	nil
]]--
end

function CoAP_Module.client:delete(type, uri[, payload])
--[[		coap.client:delete()	-	Issues a DELETE request to the server.
	Syntax		-	coap.client:delete(type, uri[, payload])
	Parameters	-	type coap.CON, coap.NON, defaults to CON. If the type is CON and request fails, the library retries four more times before giving up.
					uri the URI such as "coap://192.168.18.103:5683/v1/v/myvar", only IP addresses are supported i.e. no hostname resoltion.
					payload optional, the payload will be put in the payload section of the request.
	Returns		-	nil
]]--
end

function CoAP.Module.server_listen()
--[[	CoAP Server	-	coap.server:listen()	-	Starts the CoAP server on the given port.	
	Syntax		-	coap.server:listen(port[, ip])
	Parameters	-	port server port (number)
					ip optional IP address
	Returns		-	nil
	--]]
end
function CoAP_Module.server_close()
--[[
	coap.server:close()	-	Closes the CoAP server.
	Syntax		-	coap.server:close()
	Parameters	-	none
	Returns		-	nil
--]]
end
function CoAP_Module..server:var(name[, content_type])
--[[coap.server:var()	-	Registers a Lua variable as an endpoint in the server. the variable value then can be retrieved by a client via GET method, represented as an URI to the client. The endpoint path for varialble is '/v1/v/'.
	Syntax		-	coap.server:var(name[, content_type])
	Parameters	-	name the Lua variable's name
					content_type optional, defaults to coap.TEXT_PLAIN, see Content Negotiation
	Returns		-	nil
	--Example
		-- use copper addon for firefox
		cs=coap.Server()
		cs:listen(5683)

		myvar=1
		cs:var("myvar") -- get coap://192.168.18.103:5683/v1/v/myvar will return the value of myvar: 1
		-- cs:var(myvar), WRONG, this api accept the name string of the varialbe. but not the variable itself.
		all='[1,2,3]'
		cs:var("all", coap.JSON) -- sets content type to json
]]--
end
function CoAP.Module.server:func(name[, content_type])
--[[   coap.server:func()	-	Registers a Lua function as an endpoint in the server. The function then can be called by a client via POST method. represented as an URI to the client. The endpoint path for function is '/v1/f/'.
							When the client issues a POST request to this URI, the payload will be passed to the function as parameter. The function's return value will be the payload in the message to the client.
							The function registered SHOULD accept ONLY ONE string type parameter, and return ONE string value or return nothing.
	Syntax		-	coap.server:func(name[, content_type])
	Parameters	-	name the Lua function's name
					content_type optional, defaults to coap.TEXT_PLAIN, see Content Negotiation
	Returns		-	nil
		--Example
			-- use copper addon for firefox
			cs=coap.Server()
			cs:listen(5683)

			-- function should take only one string, return one string.
			function myfun(payload)
			  print("myfun called")
			  respond = "hello"
			  return respond
			end
			cs:func("myfun") -- post coap://192.168.18.103:5683/v1/f/myfun will call myfun
			-- cs:func(myfun), WRONG, this api accept the name string of the function. but not the function itself.
			]]--
end
return CoAP_Module