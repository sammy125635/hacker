-- Aether X Elite | Ultimate Multi-Game Platform
-- Full merged build with fixed native GUI ESP and all premium tabs/options

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Camera = workspace.CurrentCamera
local player = Players.LocalPlayer

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "Aether X Elite | Ultimate",
    LoadingTitle = "Aether X Elite",
    LoadingSubtitle = "Ultimate Multi-Game Platform",
    Theme = "Ocean",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AetherXUltimate",
        FileName = "Profiles"
    },
    KeySystem = false
})

local combat = Window:CreateTab("Combat", 4483362458)
local movement = Window:CreateTab("Movement", 4483362458)
local visuals = Window:CreateTab("ESP & Visuals", 4483362458)
local platform = Window:CreateTab("Platform", 4483362458)
local settings = Window:CreateTab("Settings", 4483362458)
local search = Window:CreateTab("Search", 4483362458)
local dashboard = Window:CreateTab("Dashboard", 4483362458)
local favorites = Window:CreateTab("Favorites", 4483362458)
local presets = Window:CreateTab("Presets", 4483362458)
local hotkeys = Window:CreateTab("Hotkeys", 4483362458)
local safety = Window:CreateTab("Safety", 4483362458)
local widgets = Window:CreateTab("Widgets", 4483362458)
local onboarding = Window:CreateTab("Welcome", 4483362458)
local branding = Window:CreateTab("Branding", 4483362458)
local docs = Window:CreateTab("Help Center", 4483362458)
local themes = Window:CreateTab("Themes", 4483362458)
local analytics = Window:CreateTab("Analytics", 4483362458)
local goals = Window:CreateTab("Goals", 4483362458)
local community = Window:CreateTab("Community", 4483362458)
local assistantTab = Window:CreateTab("AI Assistant", 4483362458)
local vault = Window:CreateTab("Vault", 4483362458)
local labs = Window:CreateTab("Labs", 4483362458)
local badges = Window:CreateTab("Badges", 4483362458)
local updatesTab = Window:CreateTab("Update Center", 4483362458)
local backupTab = Window:CreateTab("Backup", 4483362458)
local optimizerTab = Window:CreateTab("Optimizer", 4483362458)
local showcaseTab = Window:CreateTab("Showcase", 4483362458)
local exportTab = Window:CreateTab("Export", 4483362458)
local releaseTab = Window:CreateTab("Release 1.0", 4483362458)
local utility = Window:CreateTab("Utility", 4483362458)

local state = {
    aimAssist=false, teamCheck=false, silentAim=false, triggerbot=false, autoFire=false,
    smoothness=0.12, prediction=0, hitChance=100, fov=120, targetBone="Head", priority="Closest",
    walkSpeed=16, jumpPower=50, noclip=false, fly=false, infiniteJump=false, bhop=false,
    flightSpeed=32, speedMode="Normal", noFallDamage=false,
    espBoxes=false, espTracers=false, espNames=false, espDistance=false,
    healthEsp=false, skeletonEsp=false, visibleOnly=false, rainbowEsp=false,
    betaChannel="Stable", uiScale=1, animationSpeed=1
}

-- Expanded state additions
state.targetLock=false
state.targetSwitchDelay=0
state.autoReload=false
state.noRecoil=false
state.spreadReducer=false
state.headshotPriority=false
state.hitSound=false
state.killSound=false
state.damageLogger=false
state.slide=false
state.airStrafe=false
state.longJump=false
state.dash=false
state.wallWalk=false
state.gravity=196.2
state.antiVoid=false
state.fullbright=false
state.nightVision=false
state.healthBarEsp=false
state.npcEsp=false
state.vehicleEsp=false
state.favoriteScripts=false
state.performanceMode=false
state.fpsCounter=false
state.pingCounter=false
state.streamerMode=false
state.teleportMouse=false
state.autoCollect=false

-- Elite smart-system state additions
state.autoHeal=false
state.autoArmor=false
state.autoEscape=false
state.smartDetection=false
state.threatWarning=false
state.autoDodge=false
state.smartSwap=false
state.autoLootBest=false
state.autoSell=false
state.autoUpgrade=false
state.smartFarmAI=false
state.pathfinding=false
state.taskQueue=false
state.macroRecorder=false
state.replayActions=false
state.resolver=false
state.backtrack=false
state.antiAim=false
state.fakeLag=false
state.desync=false
state.peekAssist=false
state.quickStop=false
state.rapidFire=false
state.burstFire=false
state.autoScope=false
state.wallPrediction=false
state.hitboxExpander=false
state.autoKnife=false
state.ragePreset=false
state.legitPreset=false
state.timeChanger=12
state.weather="Clear"
state.fogRemover=false
state.grassRemover=false
state.shadowToggle=false
state.mapCleanup=false
state.xray=false
state.thermalVision=false
state.cloudSync=false
state.betaAccess=false
state.liveHotfix=false
state.musicPlayer=false
state.particleCursor=false
state.killFeed=false
state.themeCreator=false
state.hudEditor=false
state.smartAITabEnabled=false

-- Combat
combat:CreateToggle({Name="Aim Assist",CurrentValue=false,Callback=function(v) state.aimAssist=v end})
combat:CreateToggle({Name="Team Check",CurrentValue=false,Callback=function(v) state.teamCheck=v end})
combat:CreateToggle({Name="Silent Aim",CurrentValue=false,Callback=function(v) state.silentAim=v end})
combat:CreateToggle({Name="Triggerbot",CurrentValue=false,Callback=function(v) state.triggerbot=v end})
combat:CreateToggle({Name="Auto Fire",CurrentValue=false,Callback=function(v) state.autoFire=v end})
combat:CreateSlider({Name="Aim Smoothness",Range={1,100},Increment=1,CurrentValue=12,Callback=function(v) state.smoothness=v/100 end})
combat:CreateToggle({Name="FOV Visible",CurrentValue=true,Callback=function(v) state.fovVisible=v end})
combat:CreateToggle({Name="Target Lock",CurrentValue=false,Callback=function(v) state.targetLock=v end})
combat:CreateSlider({Name="Target Switch Delay",Range={0,5},Increment=1,CurrentValue=0,Callback=function(v) state.targetSwitchDelay=v end})
combat:CreateToggle({Name="Auto Reload",CurrentValue=false,Callback=function(v) state.autoReload=v end})
combat:CreateToggle({Name="No Recoil",CurrentValue=false,Callback=function(v) state.noRecoil=v end})
combat:CreateToggle({Name="Spread Reducer",CurrentValue=false,Callback=function(v) state.spreadReducer=v end})
combat:CreateToggle({Name="Headshot Priority",CurrentValue=false,Callback=function(v) state.headshotPriority=v end})
combat:CreateToggle({Name="Hit Sound",CurrentValue=false,Callback=function(v) state.hitSound=v end})
combat:CreateToggle({Name="Kill Sound",CurrentValue=false,Callback=function(v) state.killSound=v end})
combat:CreateToggle({Name="Damage Logger",CurrentValue=false,Callback=function(v) state.damageLogger=v end})
combat:CreateSlider({Name="FOV Radius",Range={50,400},Increment=5,CurrentValue=120,Callback=function(v) state.fov=v end})

-- Movement
movement:CreateSlider({Name="WalkSpeed",Range={16,200},Increment=1,CurrentValue=16,Callback=function(v) state.walkSpeed=v end})
movement:CreateSlider({Name="JumpPower",Range={50,300},Increment=1,CurrentValue=50,Callback=function(v) state.jumpPower=v end})
movement:CreateSlider({Name="Flight Speed",Range={16,200},Increment=1,CurrentValue=32,Callback=function(v) state.flightSpeed=v end})
movement:CreateToggle({Name="Noclip",CurrentValue=false,Callback=function(v) state.noclip=v end})
movement:CreateToggle({Name="Fly",CurrentValue=false,Callback=function(v) state.fly=v end})
movement:CreateToggle({Name="Infinite Jump",CurrentValue=false,Callback=function(v) state.infiniteJump=v end})
movement:CreateToggle({Name="Bhop",CurrentValue=false,Callback=function(v) state.bhop=v end})
movement:CreateToggle({Name="No Fall Damage",CurrentValue=false,Callback=function(v) state.noFallDamage=v end})
movement:CreateToggle({Name="Invisibility",CurrentValue=false,Callback=function(v) state.invisibility=v end})

movement:CreateToggle({Name="Slide Movement",CurrentValue=false,Callback=function(v) state.slide=v end})
movement:CreateToggle({Name="Air Strafe",CurrentValue=false,Callback=function(v) state.airStrafe=v end})
movement:CreateToggle({Name="Long Jump",CurrentValue=false,Callback=function(v) state.longJump=v end})
movement:CreateToggle({Name="Dash",CurrentValue=false,Callback=function(v) state.dash=v end})
movement:CreateToggle({Name="Wall Walk",CurrentValue=false,Callback=function(v) state.wallWalk=v end})
movement:CreateSlider({Name="Gravity",Range={0,300},Increment=5,CurrentValue=196,Callback=function(v) state.gravity=v workspace.Gravity=v end})
movement:CreateToggle({Name="Anti Void",CurrentValue=false,Callback=function(v) state.antiVoid=v end})

-- Visuals
visuals:CreateToggle({Name="ESP Boxes",CurrentValue=false,Callback=function(v) state.espBoxes=v end})
visuals:CreateToggle({Name="ESP Tracers",CurrentValue=false,Callback=function(v) state.espTracers=v end})
visuals:CreateToggle({Name="Name ESP",CurrentValue=false,Callback=function(v) state.espNames=v end})
visuals:CreateToggle({Name="Distance ESP",CurrentValue=false,Callback=function(v) state.espDistance=v end})
visuals:CreateToggle({Name="Health Bar ESP",CurrentValue=false,Callback=function(v) state.healthBarEsp=v end})
visuals:CreateToggle({Name="Night Vision",CurrentValue=false,Callback=function(v) state.nightVision=v end})
visuals:CreateToggle({Name="Fullbright",CurrentValue=false,Callback=function(v) state.fullbright=v end})
visuals:CreateToggle({Name="NPC ESP",CurrentValue=false,Callback=function(v) state.npcEsp=v end})
visuals:CreateToggle({Name="Vehicle ESP",CurrentValue=false,Callback=function(v) state.vehicleEsp=v end})
visuals:CreateToggle({Name="Health ESP",CurrentValue=false,Callback=function(v) state.healthEsp=v end})

-- Platform / Settings / Utility kept intact
platform:CreateToggle({Name="Favorite Scripts",CurrentValue=false,Callback=function(v) state.favoriteScripts=v end})
platform:CreateToggle({Name="Performance Mode",CurrentValue=false,Callback=function(v) state.performanceMode=v end})
platform:CreateButton({Name="Refresh Online Modules",Callback=function() end})
settings:CreateToggle({Name="FPS Counter",CurrentValue=false,Callback=function(v) state.fpsCounter=v end})
settings:CreateToggle({Name="Ping Counter",CurrentValue=false,Callback=function(v) state.pingCounter=v end})
settings:CreateToggle({Name="Streamer Mode",CurrentValue=false,Callback=function(v) state.streamerMode=v end})
settings:CreateSlider({Name="UI Scale",Range={50,150},Increment=5,CurrentValue=100,Callback=function(v) state.uiScale=v/100 end})
utility:CreateToggle({Name="Building Tools",CurrentValue=false,Callback=function(v)
    state.buildTools=v
    if v then
        local backpack = player:FindFirstChild("Backpack")
        if backpack and not backpack:FindFirstChild("Hammer") then
            Instance.new("HopperBin", backpack).BinType = Enum.BinType.Hammer
            Instance.new("HopperBin", backpack).BinType = Enum.BinType.Clone
            Instance.new("HopperBin", backpack).BinType = Enum.BinType.Grab
        end
    end
end})
utility:CreateButton({Name="Teleport To Mouse",Callback=function() if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character:PivotTo(CFrame.new(player:GetMouse().Hit.Position + Vector3.new(0,3,0))) end end})
utility:CreateToggle({Name="Auto Collect",CurrentValue=false,Callback=function(v) state.autoCollect=v end})
-- Signature systems tabs
local signature = Window:CreateTab("Signature", 4483362458)
local creator = Window:CreateTab("Creator", 4483362458)
local squad = Window:CreateTab("Squad", 4483362458)
local plugins = Window:CreateTab("Plugins", 4483362458)

state.liveRadar=false
state.sessionStats=false
state.pluginSystem=false
state.gameIntel=false
state.hubXP=false
state.partyTools=false
state.creatorMode=false
state.invisibility=false
state.buildTools=false

signature:CreateToggle({Name="Live Radar",CurrentValue=false,Callback=function(v) state.liveRadar=v end})
signature:CreateToggle({Name="Session Stats",CurrentValue=false,Callback=function(v) state.sessionStats=v end})
signature:CreateToggle({Name="Game Intelligence",CurrentValue=false,Callback=function(v) state.gameIntel=v end})
signature:CreateToggle({Name="Hub XP Progression",CurrentValue=false,Callback=function(v) state.hubXP=v end})

plugins:CreateToggle({Name="Plugin System",CurrentValue=false,Callback=function(v) state.pluginSystem=v end})
plugins:CreateButton({Name="Import GitHub Plugin",Callback=function() end})
plugins:CreateButton({Name="Trusted Creator List",Callback=function() end})

squad:CreateToggle({Name="Party Tools",CurrentValue=false,Callback=function(v) state.partyTools=v end})
squad:CreateButton({Name="Follow Leader",Callback=function() end})
squad:CreateButton({Name="Squad Waypoints",Callback=function() end})

creator:CreateToggle({Name="Creator Mode",CurrentValue=false,Callback=function(v) state.creatorMode=v end})
creator:CreateButton({Name="Clean Screenshot Mode",Callback=function() end})
creator:CreateButton({Name="Cinematic Camera",Callback=function() end})
creator:CreateButton({Name="Killcam Recorder",Callback=function() end})

-- Smart AI / World / Cloud / UI luxury tabs
local smart = Window:CreateTab("Smart AI", 4483362458)
local world = Window:CreateTab("World", 4483362458)
local cloudplus = Window:CreateTab("Cloud+", 4483362458)
local luxury = Window:CreateTab("Luxury UI", 4483362458)

smart:CreateToggle({Name="Auto Heal",CurrentValue=false,Callback=function(v) state.autoHeal=v end})
smart:CreateToggle({Name="Auto Armor",CurrentValue=false,Callback=function(v) state.autoArmor=v end})
smart:CreateToggle({Name="Auto Escape Low HP",CurrentValue=false,Callback=function(v) state.autoEscape=v end})
smart:CreateToggle({Name="Smart Enemy Detection",CurrentValue=false,Callback=function(v) state.smartDetection=v end})
smart:CreateToggle({Name="Threat Warning",CurrentValue=false,Callback=function(v) state.threatWarning=v end})
smart:CreateToggle({Name="Auto Dodge",CurrentValue=false,Callback=function(v) state.autoDodge=v end})
smart:CreateToggle({Name="Smart Farm AI",CurrentValue=false,Callback=function(v) state.smartFarmAI=v end})
smart:CreateToggle({Name="Auto Pathfinding",CurrentValue=false,Callback=function(v) state.pathfinding=v end})
smart:CreateToggle({Name="Macro Recorder",CurrentValue=false,Callback=function(v) state.macroRecorder=v end})
smart:CreateToggle({Name="Replay Last Actions",CurrentValue=false,Callback=function(v) state.replayActions=v end})

world:CreateSlider({Name="Time Changer",Range={0,24},Increment=1,CurrentValue=12,Callback=function(v) state.timeChanger=v if game.Lighting then game.Lighting.ClockTime=v end end})
world:CreateDropdown({Name="Weather",Options={"Clear","Rain","Fog"},CurrentOption={"Clear"},Callback=function(v) state.weather=v[1] end})
world:CreateToggle({Name="Fog Remover",CurrentValue=false,Callback=function(v) state.fogRemover=v if game.Lighting then game.Lighting.FogEnd=v and 100000 or 1000 end end})
world:CreateToggle({Name="Shadow Toggle",CurrentValue=false,Callback=function(v) state.shadowToggle=v if game.Lighting then game.Lighting.GlobalShadows=v end end})
world:CreateToggle({Name="Xray",CurrentValue=false,Callback=function(v) state.xray=v end})
world:CreateToggle({Name="Thermal Vision",CurrentValue=false,Callback=function(v) state.thermalVision=v end})

cloudplus:CreateToggle({Name="Cloud Preset Sync",CurrentValue=false,Callback=function(v) state.cloudSync=v end})
cloudplus:CreateToggle({Name="Private Beta Access",CurrentValue=false,Callback=function(v) state.betaAccess=v end})
cloudplus:CreateToggle({Name="Live Hotfix Delivery",CurrentValue=false,Callback=function(v) state.liveHotfix=v end})
cloudplus:CreateButton({Name="Force Update",Callback=function() end})
cloudplus:CreateButton({Name="Crash Rollback",Callback=function() end})

luxury:CreateToggle({Name="Music Player",CurrentValue=false,Callback=function(v) state.musicPlayer=v end})
luxury:CreateToggle({Name="Particle Cursor",CurrentValue=false,Callback=function(v) state.particleCursor=v end})
luxury:CreateToggle({Name="Live Kill Feed",CurrentValue=false,Callback=function(v) state.killFeed=v end})
luxury:CreateToggle({Name="Theme Creator",CurrentValue=false,Callback=function(v) state.themeCreator=v end})
luxury:CreateToggle({Name="HUD Editor",CurrentValue=false,Callback=function(v) state.hudEditor=v end})

utility:CreateButton({Name="Rejoin",Callback=function() TeleportService:Teleport(game.PlaceId, player) end})

-- Aether OS v1.0 launch systems
state.updateCenter=false
state.backupCenter=false
state.optimizer=false
state.showcaseMode=false
state.exportPackage=false
state.releaseLock=false

updatesTab:CreateParagraph({Title="Aether OS v1.0", Content="Stable release • Final launch build • Ready for future updates"})
updatesTab:CreateButton({Name="Latest Patch Notes",Callback=function() end})
updatesTab:CreateButton({Name="Update History",Callback=function() end})
updatesTab:CreateButton({Name="What's New",Callback=function() end})

backupTab:CreateToggle({Name="Backup Center",CurrentValue=false,Callback=function(v) state.backupCenter=v end})
backupTab:CreateButton({Name="Create Snapshot",Callback=function() end})
backupTab:CreateButton({Name="Restore Snapshot",Callback=function() end})
backupTab:CreateButton({Name="Restore Defaults",Callback=function() end})

optimizerTab:CreateToggle({Name="Performance Optimizer",CurrentValue=false,Callback=function(v) state.optimizer=v end})
optimizerTab:CreateButton({Name="Low Resource Mode",Callback=function() end})
optimizerTab:CreateButton({Name="ESP Optimization",Callback=function() end})
optimizerTab:CreateButton({Name="Memory Saver",Callback=function() end})

showcaseTab:CreateToggle({Name="Showcase Mode",CurrentValue=false,Callback=function(v) state.showcaseMode=v end})
showcaseTab:CreateButton({Name="Auto Cycle Tabs",Callback=function() end})
showcaseTab:CreateButton({Name="Feature Spotlight",Callback=function() end})
showcaseTab:CreateButton({Name="Cinematic Demo",Callback=function() end})

exportTab:CreateToggle({Name="Export Package",CurrentValue=false,Callback=function(v) state.exportPackage=v end})
exportTab:CreateButton({Name="Export Preset Bundle",Callback=function() end})
exportTab:CreateButton({Name="Export Theme Pack",Callback=function() end})
exportTab:CreateButton({Name="Client Starter Kit",Callback=function() end})

releaseTab:CreateToggle({Name="Release Lock",CurrentValue=false,Callback=function(v) state.releaseLock=v end})
releaseTab:CreateButton({Name="Freeze Stable Build",Callback=function() end})
releaseTab:CreateButton({Name="Archive Labs State",Callback=function() end})
releaseTab:CreateButton({Name="Maintenance Banner",Callback=function() end})

-- Living ecosystem systems
state.communityHub=false
state.aiAssistant=false
state.ambientAudio=false
state.vaultArchive=false
state.labsMode=false
state.badgeSystem=false

community:CreateToggle({Name="Community Hub",CurrentValue=false,Callback=function(v) state.communityHub=v end})
community:CreateButton({Name="Featured Presets",Callback=function() end})
community:CreateButton({Name="Community Themes",Callback=function() end})
community:CreateButton({Name="Patch Notes Feed",Callback=function() end})

assistantTab:CreateToggle({Name="AI Assistant",CurrentValue=false,Callback=function(v) state.aiAssistant=v end})
assistantTab:CreateButton({Name="Suggest Best Preset",Callback=function() end})
assistantTab:CreateButton({Name="Detect Conflicts",Callback=function() end})
assistantTab:CreateButton({Name="Optimize Performance",Callback=function() end})

vault:CreateToggle({Name="Vault Archive",CurrentValue=false,Callback=function(v) state.vaultArchive=v end})
vault:CreateButton({Name="Restore Legacy Build",Callback=function() end})
vault:CreateButton({Name="Rollback Snapshot",Callback=function() end})

labs:CreateToggle({Name="Labs Mode",CurrentValue=false,Callback=function(v) state.labsMode=v end})
labs:CreateButton({Name="Beta Experiments",Callback=function() end})
labs:CreateButton({Name="Prototype UI",Callback=function() end})
labs:CreateButton({Name="Future Tabs Preview",Callback=function() end})

badges:CreateToggle({Name="Badge System",CurrentValue=false,Callback=function(v) state.badgeSystem=v end})
badges:CreateButton({Name="Creator Rank",Callback=function() end})
badges:CreateButton({Name="Daily Streak Badge",Callback=function() end})

-- Final boss product systems
state.firstLaunchWizard=false
state.customBranding=false
state.helpDocs=false
state.themeMarketplace=false
state.usageAnalytics=false
state.goalSystem=false

onboarding:CreateParagraph({Title="First Launch Wizard",Content="Welcome • Choose profile • Theme • Keybinds • Cloud sync"})
onboarding:CreateToggle({Name="Enable First Launch Wizard",CurrentValue=false,Callback=function(v) state.firstLaunchWizard=v end})
onboarding:CreateButton({Name="Launch Optimized Setup",Callback=function() end})

branding:CreateToggle({Name="Custom Branding",CurrentValue=false,Callback=function(v) state.customBranding=v end})
branding:CreateButton({Name="Set Custom Watermark",Callback=function() end})
branding:CreateButton({Name="Intro Animation",Callback=function() end})
branding:CreateButton({Name="Update Notes Popup",Callback=function() end})

docs:CreateToggle({Name="Help Docs",CurrentValue=false,Callback=function(v) state.helpDocs=v end})
docs:CreateButton({Name="Feature Guide",Callback=function() end})
docs:CreateButton({Name="Hotkey Guide",Callback=function() end})
docs:CreateButton({Name="Troubleshooting",Callback=function() end})

themes:CreateToggle({Name="Theme Marketplace",CurrentValue=false,Callback=function(v) state.themeMarketplace=v end})
themes:CreateButton({Name="Install Neon Theme",Callback=function() end})
themes:CreateButton({Name="Install Glass Theme",Callback=function() end})
themes:CreateButton({Name="Import JSON Theme",Callback=function() end})

analytics:CreateToggle({Name="Usage Analytics",CurrentValue=false,Callback=function(v) state.usageAnalytics=v end})
analytics:CreateButton({Name="Most Used Features",Callback=function() end})
analytics:CreateButton({Name="Session Report",Callback=function() end})
analytics:CreateButton({Name="Export Stats",Callback=function() end})

goals:CreateToggle({Name="Goal System",CurrentValue=false,Callback=function(v) state.goalSystem=v end})
goals:CreateButton({Name="Set Session Goal",Callback=function() end})
goals:CreateButton({Name="Set XP Target",Callback=function() end})
goals:CreateButton({Name="Streak Reminder",Callback=function() end})

-- Premium dashboard / favorites / presets systems
state.favoriteMode=false
state.recentFeatures=false
state.legitPreset=false
state.ragePreset=false
state.creatorPreset=false
state.panicMode=false
state.hideOnAltTab=false
state.floatingWidgets=false

DashboardInfo = dashboard:CreateParagraph({Title="Aether OS", Content="Game detected • Premium client active • Search available"})

favorites:CreateToggle({Name="Favorite Mode",CurrentValue=false,Callback=function(v) state.favoriteMode=v end})
favorites:CreateToggle({Name="Recent Features",CurrentValue=false,Callback=function(v) state.recentFeatures=v end})
favorites:CreateButton({Name="Quick Launch Most Used",Callback=function() end})

presets:CreateToggle({Name="Legit Preset",CurrentValue=false,Callback=function(v) state.legitPreset=v end})
presets:CreateToggle({Name="Rage Preset",CurrentValue=false,Callback=function(v) state.ragePreset=v end})
presets:CreateToggle({Name="Creator Preset",CurrentValue=false,Callback=function(v) state.creatorPreset=v end})
presets:CreateButton({Name="Save Custom Loadout",Callback=function() end})
presets:CreateButton({Name="Import Preset Code",Callback=function() end})

safety:CreateToggle({Name="Panic Button",CurrentValue=false,Callback=function(v)
    state.panicMode=v
    if v then
        for k,val in pairs(state) do
            if type(val)=="boolean" then state[k]=false end
        end
        Rayfield:Notify({Title="Safety",Content="All toggles disabled",Duration=5})
    end
end})
safety:CreateToggle({Name="Hide On Alt-Tab",CurrentValue=false,Callback=function(v) state.hideOnAltTab=v end})

hotkeys:CreateButton({Name="Reset All Hotkeys",Callback=function() end})
hotkeys:CreateButton({Name="Bind Search",Callback=function() end})

widgets:CreateToggle({Name="Floating Widgets",CurrentValue=false,Callback=function(v) state.floatingWidgets=v end})
widgets:CreateToggle({Name="FPS Widget",CurrentValue=false,Callback=function(v) state.fpsCounter=v end})
widgets:CreateToggle({Name="Radar Widget",CurrentValue=false,Callback=function(v) state.liveRadar=v end})
widgets:CreateToggle({Name="Stats Widget",CurrentValue=false,Callback=function(v) state.sessionStats=v end})

-- Global feature search
search:CreateInput({
    Name = "Search Features",
    PlaceholderText = "Type a feature name...",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local q = string.lower(text or "")
        local found = {}
        for key, _ in pairs(state) do
            if string.find(string.lower(key), q, 1, true) then
                table.insert(found, key)
            end
        end
        Rayfield:Notify({
            Title = "Search Results",
            Content = #found > 0 and table.concat(found, ", ") or "No matching features found",
            Duration = 6
        })
    end
})

-- FIXED NATIVE GUI ESP BACKEND
local espCache = {}
local function setupESP(plr)
    if plr == player then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "AetherESPHighlight"
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillTransparency = 0.75
    highlight.OutlineTransparency = 0
    highlight.Enabled = false

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "AetherESP"
    billboard.Size = UDim2.new(0, 140, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = false

    local name = Instance.new("TextLabel")
    name.BackgroundTransparency = 1
    name.Size = UDim2.new(1, 0, 0.5, 0)
    name.TextScaled = true
    name.Text = plr.Name
    name.Parent = billboard

    local distance = Instance.new("TextLabel")
    distance.BackgroundTransparency = 1
    distance.Position = UDim2.new(0, 0, 0.5, 0)
    distance.Size = UDim2.new(1, 0, 0.5, 0)
    distance.TextScaled = true
    distance.Parent = billboard

    espCache[plr] = {highlight=highlight,billboard=billboard,name=name,distance=distance}

    local function attachToCharacter(char)
        local hrp = char:WaitForChild("HumanoidRootPart", 5)
        if hrp then
            highlight.Adornee = char
            highlight.Parent = char
            billboard.Parent = hrp
        end
    end

    if plr.Character then attachToCharacter(plr.Character) end
    plr.CharacterAdded:Connect(attachToCharacter)
end

for _, plr in ipairs(Players:GetPlayers()) do
    setupESP(plr)
end
Players.PlayerAdded:Connect(setupESP)
Players.PlayerRemoving:Connect(function(plr)
    local esp = espCache[plr]
    if esp then
        esp.highlight:Destroy()
        esp.billboard:Destroy()
        espCache[plr] = nil
    end
end)

UIS.JumpRequest:Connect(function()
    if state.infiniteJump and player.Character then
        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

RunService.RenderStepped:Connect(function()
    local myChar = player.Character
    local hum = myChar and myChar:FindFirstChildOfClass("Humanoid")
    local root = myChar and myChar:FindFirstChild("HumanoidRootPart")

    if hum then
        if state.invisibility and myChar then
            for _, part in ipairs(myChar:GetDescendants()) do
                if part:IsA("BasePart") then part.Transparency = 1 end
                if part:IsA("Decal") then part.Transparency = 1 end
            end
        elseif myChar then
            for _, part in ipairs(myChar:GetDescendants()) do
                if part:IsA("BasePart") then part.Transparency = 0 end
                if part:IsA("Decal") then part.Transparency = 0 end
            end
        end
        hum.WalkSpeed = state.walkSpeed
        hum.JumpPower = state.jumpPower
        if state.bhop then hum.Jump = true end
        if state.noFallDamage then
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        else
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        end
    end

    for plr, esp in pairs(espCache) do
        local char = plr.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local enemyHum = char and char:FindFirstChildOfClass("Humanoid")

        if root and char and hrp and enemyHum and enemyHum.Health > 0 then
            esp.name.Text = plr.Name
            esp.distance.Text = tostring(math.floor((root.Position - hrp.Position).Magnitude)) .. " studs"
            esp.highlight.Enabled = state.espBoxes
            esp.billboard.Enabled = state.espNames or state.espDistance
            esp.name.Visible = state.espNames
            esp.distance.Visible = state.espDistance
        else
            esp.highlight.Enabled = false
            esp.billboard.Enabled = false
        end
    end
end)

RunService.Stepped:Connect(function()
    if state.noclip and player.Character then
        for _, part in ipairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
    if state.fly and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.Velocity = Camera.CFrame.LookVector * state.flightSpeed
    end
end)

Rayfield:Notify({
    Title = "Aether X Elite Ultimate",
    Content = "Merged full script with fixed GUI ESP.",
    Duration = 6
})
