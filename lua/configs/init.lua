
local M = {}
local L = {}

M.load_config = function()
  --local pwd = vim.fn.getcwd() .. "/pj_conf.json"
  --
  --local file = io.open(pwd, "r")
  --if not file then
  --  print("Could not open file: " .. pwd)
  --  return
  --end
  --local json_content = file:read("*all")
  --file:close()
  --if not json_content then
  --  print("Cant parse config")
  --end
  --local success, config = pcall(vim.fn.json_decode, json_content)
  --if not success then
  --  print("Failed to decode config: " .. config)
  --  return
  --end
  --
  --if config.flutter then
  --  print("flutter")
  --  L.load_flutter_conf(config.flutter)
  --end
end


return M

