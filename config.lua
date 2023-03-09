Config = {}

--[[
    For each Config.MonitoredLocations[x]:
    - label: Name of location
        - Not currently in use, more so for knowing which location we're looking at in the
          config without having to go to the coords in game
    - coords: Center coordinates of zone that script is listening for shooting from
    - alertDistance: Amount of GTA units from coords that script is listening for shooting from
    - alertText: Alert text police will receive
    - alertCooldown: Minimum amount of seconds before alert can be triggered in server at location again
    - active: If the location is active
        - Set to false to disable alerts at location
]]
Config.MonitoredLocations = {
    [1] = {
        label = 'Blaine County Savings Bank',
        coords = vector3(-113.47, 6469.58, 31.63),
        alertDistance = 10,
        alertText = 'Shooting at Blaine County Savings Bank',
        alertCooldown = 60,
        active = true
    },
    [2] = {
        label = 'Pacific Standard Bank',
        coords = vector3(247.16, 223.32, 106.29),
        alertDistance = 15,
        alertText = 'Shooting at Pacific Standard Bank',
        alertCooldown = 60,
        active = true
    }
}