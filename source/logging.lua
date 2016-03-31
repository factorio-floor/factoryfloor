
LOGGING_DEBUG = false
LOG_LEVEL = 1 -- 1=info 2=warning 3=error

local printIndex = 1
function PlayerPrint(message)
	if not game then
		debug(message)
		return
	end
	for _,player in pairs(game.players) do
		player.print(printIndex.." "..message)
		printIndex = printIndex + 1
	end
end

-- Namespaced Logger

logging = {}

logging.info = function(message)
	if LOG_LEVEL<=1 then logging.log(message,"INFO") end
end

logging.warn = function(message)
	if LOG_LEVEL<=2 then logging.log(message,"WARN") end
end

logging.error = function(message)
	if LOG_LEVEL<=3 then logging.log(message,"ERROR") end
end

logging.debug = function(message)
	if LOG_LEVEL<=3 then logging.log(message,"ERROR") end
end

logging.log = function(message,level)
	if not level then level="ANY" end
	if LOGGING_DEBUG then
		if type(message) ~= "string" then
			message = serpent.block(message)
		end
		print(level..": "..message)
	end
end

-- Depricated Loggerrs

function info(message)
	logging.warn("function 'info' will be removed in a future version, use 'logging.info'")
	print(debug.traceback())
	logging.info(message)
end
function warn(message)
	logging.warn("function 'warn' will be removed in a future version, use 'logging.warn'")
	print(debug.traceback())
	logging.warn(message)
	print(debug.traceback())
end
function error(message)
	logging.warn("function 'error' will be removed in a future version, use 'logging.error'")
	print(debug.traceback())
	logging.error(message)
end
-- we can't offer the 'debug' namespace anymore because its a lua builtin (that we use)
