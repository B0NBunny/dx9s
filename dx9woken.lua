--indent size 4
dx9 = dx9 --in VS Code, this gets rid of a ton of problem underlines
--dx9.ShowConsole(true)

Config = _G.Config or {
	urls = {
		DXLibUI = "https://raw.githubusercontent.com/Brycki404/DXLibUI/refs/heads/main/main.lua";
		LibESP = "https://raw.githubusercontent.com/Brycki404/DXLibESP/refs/heads/main/main.lua";
	};
    settings = {
		menu_toggle_keybind = "[F2]";

		esp_enabled = true;
        box_type = 1; -- 1 = "Corners", 2 = "2D Box", 3 = "3D Box"
        tracer_type = 1; -- 1= "Near-Bottom", 2 = "Bottom", 3 = "Top", 4 = "Mouse"
    };
    players = {
        enabled = true;
        distance = true;
        healthbar = true;
        healthtag = false;
		maxhealthtag = false;
        nametag = true;
        tracer = false;
        color = { 0, 0, 255 };
		distance_limit = 5000;
    };
	enemies = {
        enabled = true;
        distance = true;
        healthbar = true;
		healthtag = false;
		maxhealthtag = false;
        nametag = true;
        tracer = false;
		color = { 255, 0, 0 };
		distance_limit = 5000;
    };
	npcs = {
		enabled = false;
        distance = true;
        nametag = true;
        tracer = false;
		color = { 255, 255, 255 };
		distance_limit = 5000;
	};
}
if _G.Config == nil then
	_G.Config = Config
	Config = _G.Config
end

Lib_ui = loadstring(dx9.Get(Config.urls.DXLibUI))()

Lib_esp = loadstring(dx9.Get(Config.urls.LibESP))()

Interface = Lib_ui:CreateWindow({
	Title = "Deepwoken | dx9ware | By @Brycki";
	Size = { 500, 500 };
	Resizable = true;

	ToggleKey = Config.settings.menu_toggle_keybind;

	FooterToggle = true;
	FooterRGB = true;
	FontColor = { 255, 255, 255 };
	MainColor = { 32, 26, 68 };
	BackgroundColor = { 26, 21, 55 };
	AccentColor = { 81, 37, 112 };
	OutlineColor = { 54, 47, 90 };
})

Tabs = {
	settings = Interface:AddTab("Settings");
	players = Interface:AddTab("Players");
	enemies = Interface:AddTab("Enemies");
	npcs = Interface:AddTab("NPCs");
}

Groupboxes = {
	esp_settings = Tabs.settings:AddLeftGroupbox("ESP");
	players = Tabs.players:AddLeftGroupbox("Players ESP");
	enemies = Tabs.enemies:AddLeftGroupbox("Enemies ESP");
	npcs = Tabs.npcs:AddLeftGroupbox("NPCs ESP");
}

Esp_settings = {
	enabled = Groupboxes.esp_settings
		:AddToggle({
			Default = Config.settings.esp_enabled;
			Text = "ESP Enabled";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Settings] Enabled Global ESP" or "[Settings] Disabled Global ESP", 1)
		end);

	box_type = Groupboxes.esp_settings
		:AddDropdown({
			Text = "Box Type";
			Default = Config.settings.box_type;
			Values = { "Corners", "2D Box", "3D Box" };
		})
		:OnChanged(function(value)
			Lib_ui:Notify("[Settings] Box Type: " .. value, 1)
		end);

	tracer_type = Groupboxes.esp_settings
		:AddDropdown({
			Text = "Tracer Type";
			Default = Config.settings.tracer_type;
			Values = { "Near-Bottom", "Bottom", "Top", "Mouse" };
		})
		:OnChanged(function(value)
			Lib_ui:Notify("[Settings] Tracer Type: " .. value, 1)
		end);
}

Players = {
	enabled = Groupboxes.players
		:AddToggle({
			Default = Config.players.enabled;
			Text = "Enabled";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Players] Enabled ESP" or "[Players] Disabled ESP", 1)
		end);

	distance = Groupboxes.players
		:AddToggle({
			Default = Config.players.distance;
			Text = "Distance";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Players] Enabled Distance" or "[Players] Disabled Distance", 1)
		end);
    
	nametag = Groupboxes.players
		:AddToggle({
			Default = Config.players.nametag;
			Text = "Nametag";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Players] Enabled Nametag" or "[Players] Disabled Nametag", 1)
		end);

	healthbar = Groupboxes.players:AddToggle({
			Default = Config.players.healthbar;
			Text = "HealthBar";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Players] Enabled HealthBar" or "[Players] Disabled HealthBar", 1)
		end);

    healthtag = Groupboxes.players
		:AddToggle({
			Default = Config.players.healthtag;
			Text = "HealthTag";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Players] Enabled HealthTag" or "[Players] Disabled HealthTag", 1)
		end);

	maxhealthtag = Groupboxes.players:AddToggle({
			Default = Config.players.maxhealthtag;
			Text = "MaxHealthTag";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Players] Enabled MaxHealthTag" or "[Players] Disabled MaxHealthTag", 1)
		end);

	tracer = Groupboxes.players
		:AddToggle({
			Default = Config.players.tracer;
			Text = "Tracer";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Players] Enabled Tracer" or "[Players] Disabled Tracer", 1)
		end);

    color = Groupboxes.players:AddColorPicker({
		Default = Config.players.color;
		Text = "Color";
	});

    distance_limit = Groupboxes.players:AddSlider({
		Default = Config.players.distance_limit;
		Text = "ESP Distance Limit";
		Min = 0;
		Max = 5000;
		Rounding = 0;
	});
}

Enemies = {
	enabled = Groupboxes.enemies
		:AddToggle({
			Default = Config.enemies.enabled;
			Text = "Enabled";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Enemies] Enabled ESP" or "[Enemies] Disabled ESP", 1)
		end);

	distance = Groupboxes.enemies
		:AddToggle({
			Default = Config.enemies.distance;
			Text = "Distance";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Enemies] Enabled Distance" or "[Enemies] Disabled Distance", 1)
		end);

	nametag = Groupboxes.enemies
		:AddToggle({
			Default = Config.enemies.nametag;
			Text = "Nametag";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Enemies] Enabled Nametag" or "[Enemies] Disabled Nametag", 1)
		end);

	healthbar = Groupboxes.enemies:AddToggle({
			Default = Config.enemies.healthbar;
			Text = "HealthBar";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Enemies] Enabled HealthBar" or "[Enemies] Disabled HealthBar", 1)
		end);

	healthtag = Groupboxes.enemies
		:AddToggle({
			Default = Config.enemies.healthtag;
			Text = "HealthTag";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Enemies] Enabled HealthTag" or "[Enemies] Disabled HealthTag", 1)
		end);

	maxhealthtag = Groupboxes.enemies:AddToggle({
			Default = Config.enemies.maxhealthtag;
			Text = "MaxHealthTag";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Enemies] Enabled MaxHealthTag" or "[Enemies] Disabled MaxHealthTag", 1)
		end);

	tracer = Groupboxes.enemies
		:AddToggle({
			Default = Config.enemies.tracer;
			Text = "Tracer";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[Enemies] Enabled Tracer" or "[Enemies] Disabled Tracer", 1)
		end);

    color = Groupboxes.enemies:AddColorPicker({
		Default = Config.enemies.color;
		Text = "Color";
	});

	distance_limit = Groupboxes.enemies:AddSlider({
		Default = Config.enemies.distance_limit;
		Text = "ESP Distance Limit";
		Min = 0;
		Max = 5000;
		Rounding = 0;
	});
}

Npcs = {
	enabled = Groupboxes.npcs
		:AddToggle({
			Default = Config.npcs.enabled;
			Text = "Enabled";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[NPCs] Enabled ESP" or "[NPCs] Disabled ESP", 1)
		end);

	distance = Groupboxes.npcs
		:AddToggle({
			Default = Config.npcs.distance;
			Text = "Distance";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[NPCs] Enabled Distance" or "[NPCs] Disabled Distance", 1)
		end);

	nametag = Groupboxes.npcs
		:AddToggle({
			Default = Config.npcs.nametag;
			Text = "Nametag";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[NPCs] Enabled Nametag" or "[NPCs] Disabled Nametag", 1)
		end);

	tracer = Groupboxes.npcs
		:AddToggle({
			Default = Config.npcs.tracer;
			Text = "Tracer";
		})
		:OnChanged(function(value)
			Lib_ui:Notify(value and "[NPCs] Enabled Tracer" or "[NPCs] Disabled Tracer", 1)
		end);

    color = Groupboxes.npcs:AddColorPicker({
		Default = Config.npcs.color;
		Text = "Color";
	});

	distance_limit = Groupboxes.npcs:AddSlider({
		Default = Config.npcs.distance_limit;
		Text = "ESP Distance Limit";
		Min = 0;
		Max = 5000;
		Rounding = 0;
	});
}

if _G.Get_Distance == nil then
	_G.Get_Distance = function(v1, v2)
		local a = (v1.x - v2.x) * (v1.x - v2.x)
		local b = (v1.y - v2.y) * (v1.y - v2.y)
		local c = (v1.z - v2.z) * (v1.z - v2.z)

		return math.floor(math.sqrt(a + b + c) + 0.5)
	end
end

if _G.Get_Index == nil then
	_G.Get_Index = function(type, value)
		local table = nil
		if type == "tracer" then
			table = { "Near-Bottom", "Bottom", "Top", "Mouse" }
		elseif type == "box" then
			table = { "Corners", "2D Box", "3D Box" }
		end

		if table then
			for index, item in pairs(table) do
				if item == value then
					return index
				end
			end
		end

		return nil
	end
end

Datamodel = dx9.GetDatamodel()
Workspace = dx9.FindFirstChild(Datamodel, "Workspace")
Services = {
	players = dx9.FindFirstChild(Datamodel, "Players");
}

Local_player = nil

Current_tracer_type = _G.Get_Index("tracer", Esp_settings.tracer_type.Value)
Current_box_type = _G.Get_Index("box", Esp_settings.box_type.Value)

if Local_player == nil then
	for _, player in pairs(dx9.GetChildren(Services.players)) do
		local pgui = dx9.FindFirstChild(player, "PlayerGui")
		if pgui ~= nil and pgui ~= 0 then
			Local_player = player
			break
		end
	end
end

if Local_player == nil or Local_player == 0 then
	Local_player = dx9.get_localplayer()
end

function Get_local_player_name()
	if dx9.GetType(Local_player) == "Player" then
		return dx9.GetName(Local_player)
	else
		return Local_player.Info.Name
	end
end

Local_player_name = Get_local_player_name()

Workspace_Live = dx9.FindFirstChild(Workspace, "Live")
Workspace_NPCs = dx9.FindFirstChild(Workspace, "NPCs")

if Workspace_Live == nil or Workspace_Live == 0 or Workspace_NPCs == nil or Workspace_NPCs == 0 then
	return false
end

My_player = dx9.FindFirstChild(Services.players, Local_player_name)
My_character = nil
My_head = nil
My_root = nil
My_humanoid = nil

if My_player == nil or My_player == 0 then
	return
elseif My_player ~= nil and My_player ~= 0 then
    My_character = dx9.FindFirstChild(Workspace_Live, Local_player_name)
end

if My_character == nil or My_character == 0 then
	return
elseif My_character ~= nil and My_character ~= 0 then
	My_head = dx9.FindFirstChild(My_character, "Head")
	My_root = dx9.FindFirstChild(My_character, "HumanoidRootPart")
	My_humanoid = dx9.FindFirstChild(My_character, "Humanoid")
end

if My_root == nil or My_root == 0 then
    return
end

if My_head == nil or My_head == 0 then
    return
end

Screen_size = nil

if _G.IsOnScreen == nil then
	_G.IsOnScreen = function(screen_pos)
		Screen_size = dx9.size()
		if screen_pos and screen_pos ~= 0 and screen_pos.x > 0 and screen_pos.y > 0 and screen_pos.x < Screen_size.width and screen_pos.y < Screen_size.height then
			return true
		end
		return false
	end
end

if not Esp_settings.enabled.Value then
	return
end

if _G.LiveTask == nil then
	_G.LiveTask = function()
        if Players.enabled.Value or Enemies.enabled.Value then
            for _, entity in pairs(dx9.GetChildren(Workspace_Live)) do
                local entityName = dx9.GetName(entity)
                local entityTab = Enemies
                local entityConfig = Config.enemies
                local playerObject = dx9.FindFirstChild(Services.players, entityName)
                if playerObject and playerObject ~= 0 then
                    entityTab = Players
                    entityConfig = Config.players
                end
				local humanoid = dx9.FindFirstChild(entity, "Humanoid")
				local health = nil
				local maxhealth = nil
				if humanoid ~= nil and humanoid ~= 0 then
					health = dx9.GetHealth(humanoid) or nil
					maxhealth = dx9.GetMaxHealth(humanoid) or nil
				end
				if health ~= nil then
					health = math.floor(health)
				end
				if maxhealth ~= nil then
					maxhealth = math.floor(maxhealth)
				end
                local root = dx9.FindFirstChild(entity, "HumanoidRootPart")
                if root and root ~= 0 then
                    local my_root_pos = dx9.GetPosition(My_root)
                    local root_pos = dx9.GetPosition(root)
                    local root_distance = _G.Get_Distance(my_root_pos, root_pos)
                    if root_distance < entityTab.distance_limit.Value then
                        local root_screen_pos = dx9.WorldToScreen({root_pos.x, root_pos.y, root_pos.z})
                        if _G.IsOnScreen(root_screen_pos) then
							local customName = entityName
							if entityTab.healthtag.Value and entityTab.maxhealthtag.Value and health ~= nil and maxhealth ~= nil then
								customName = entityName .. " | " .. tostring(health) .. "/" .. tostring(maxhealth) .. " hp"
							elseif entityTab.healthtag.Value and health ~= nil then
								customName = entityName .. " | " .. tostring(health) .. " hp"
							end
                        	Lib_esp.draw({
                                target = entity;
                                color = entityTab.color.Value;
                                healthbar = entityConfig.healthbar;
                                nametag = entityTab.nametag.Value;
                                custom_nametag = customName;
                                distance = entityTab.distance.Value;
                                custom_distance = ""..root_distance;
                                tracer = entityTab.tracer.Value;
                                tracer_type = Current_tracer_type;
                                box_type = Current_box_type;
                            })
                        end
                    end
                end
            end
        end
	end
end
if _G.LiveTask then
	_G.LiveTask()
end

if _G.NPCTask == nil then
	_G.NPCTask = function()
		if Npcs.enabled.Value then
            for _, npc in pairs(dx9.GetChildren(Workspace_NPCs)) do
                local npcName = dx9.GetName(npc)
                local root = dx9.FindFirstChild(npc, "HumanoidRootPart")
                if root and root ~= 0 then
                    local my_root_pos = dx9.GetPosition(My_root)
                    local root_pos = dx9.GetPosition(root)
                    local root_distance = _G.Get_Distance(my_root_pos, root_pos)
                    if root_distance < Npcs.distance_limit.Value then
                        local root_screen_pos = dx9.WorldToScreen({root_pos.x, root_pos.y, root_pos.z})
                        if _G._G.IsOnScreen(root_screen_pos) then
                            Lib_esp.draw({
                                target = npc;
                                custom_root = npcName;
                                color = Npcs.color.Value;
                                healthbar = false;
                                nametag = Npcs.nametag.Value;
                                custom_nametag = npcName;
                                distance = Npcs.distance.Value;
                                custom_distance = ""..root_distance;
                                tracer = Npcs.tracer.Value;
                                tracer_type = Current_tracer_type;
                                box_type = Current_box_type;
                            })
                        end
                    end
                end
            end
        end
    end
end
if _G.NPCTask then
	_G.NPCTask()
end

