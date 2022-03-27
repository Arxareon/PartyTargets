--Addon name, namespace
local addonNameSpace, ns = ...
local _, addon = GetAddOnInfo(addonNameSpace)

--WidgetTools reference
local wt = WidgetToolbox[ns.WidgetToolsVersion]


--[[ ASSETS & RESOURCES ]]

local root = "Interface/AddOns/" .. addonNameSpace .. "/"

--Strings & Localization
local strings = ns.LoadLocale()
strings.chat.keyword = "/partar"

--Colors
local colors = {
	red = {
		[0] = { r = 1, g = 0.22, b = 0 },
		[1] = { r = 1, g = 0.47, b = 0.33 },
	},
	blue = {
		[0] = { r = 0.27, g = 0.75, b = 1 },
		[1] = { r = 0.51, g = 0.88, b = 1 },
	},
}

--Fonts
local fonts = {
	[0] = { name = strings.misc.default, path = strings.misc.defaultFont },
	-- [1] = { name = "Arbutus Slab", path = root .. "Fonts/ArbutusSlab.ttf" },
	-- [2] = { name = "Caesar Dressing", path = root .. "Fonts/CaesarDressing.ttf" },
	-- [3] = { name = "Germania One", path = root .. "Fonts/GermaniaOne.ttf" },
	-- [4] = { name = "Mitr", path = root .. "Fonts/Mitr.ttf" },
	-- [5] = { name = "Oxanium", path = root .. "Fonts/Oxanium.ttf" },
	-- [6] = { name = "Pattaya", path = root .. "Fonts/Pattaya.ttf" },
	-- [7] = { name = "Reem Kufi", path = root .. "Fonts/ReemKufi.ttf" },
	-- [8] = { name = "Source Code Pro", path = root .. "Fonts/SourceCodePro.ttf" },
	-- [9] = { name = strings.misc.custom, path = root .. "Fonts/CUSTOM.ttf" },
}

--Textures
local textures = {
	logo = root .. "Textures/Logo.tga",
}

--Anchor Points
local anchors = {
	[0] = { name = strings.points.top.left, point = "TOPLEFT" },
	[1] = { name = strings.points.top.center, point = "TOP" },
	[2] = { name = strings.points.top.right, point = "TOPRIGHT" },
	[3] = { name = strings.points.left, point = "LEFT" },
	[4] = { name = strings.points.center, point = "CENTER" },
	[5] = { name = strings.points.right, point = "RIGHT" },
	[6] = { name = strings.points.bottom.left, point = "BOTTOMLEFT" },
	[7] = { name = strings.points.bottom.center, point = "BOTTOM" },
	[8] = { name = strings.points.bottom.right, point = "BOTTOMRIGHT" },
}


--[[ DATA TABLES ]]

--[ Addon DBs ]

--References
local db --Account-wide options
local dbc --Character-specific options
local cs --Cross-session account-wide data

--Default values
local dbDefault = {
	display = {
		position = {
			[0] = {
				point = "TOP",
				offset = { x = -320, y = -120, },
			},
			[1] = {
				point = "TOP",
				offset = { x = -320, y = -140, },
			},
			[2] = {
				point = "TOP",
				offset = { x = -320, y = -160, },
			},
			[3] = {
				point = "TOP",
				offset = { x = -320, y = -180, },
			},
			[4] = {
				point = "TOP",
				offset = { x = -320, y = -200, },
			},
			[5] = {
				point = "TOP",
				offset = { x = -320, y = -220, },
			},
			[6] = {
				point = "TOP",
				offset = { x = -320, y = -240, },
			},
			[7] = {
				point = "TOP",
				offset = { x = -320, y = -260, },
			},
			[8] = {
				point = "TOP",
				offset = { x = -320, y = -280, },
			},
			[9] = {
				point = "TOP",
				offset = { x = -320, y = -300, },
			},
			[10] = {
				point = "TOP",
				offset = { x = -220, y = -120, },
			},
			[11] = {
				point = "TOP",
				offset = { x = -220, y = -140, },
			},
			[12] = {
				point = "TOP",
				offset = { x = -220, y = -160, },
			},
			[13] = {
				point = "TOP",
				offset = { x = -220, y = -180, },
			},
			[14] = {
				point = "TOP",
				offset = { x = -220, y = -200, },
			},
			[15] = {
				point = "TOP",
				offset = { x = -220, y = -220, },
			},
			[16] = {
				point = "TOP",
				offset = { x = -220, y = -240, },
			},
			[17] = {
				point = "TOP",
				offset = { x = -220, y = -260, },
			},
			[18] = {
				point = "TOP",
				offset = { x = -220, y = -280, },
			},
			[19] = {
				point = "TOP",
				offset = { x = -220, y = -300, },
			},
			[20] = {
				point = "TOP",
				offset = { x = -120, y = -120, },
			},
			[21] = {
				point = "TOP",
				offset = { x = -120, y = -140, },
			},
			[22] = {
				point = "TOP",
				offset = { x = -120, y = 160, },
			},
			[23] = {
				point = "TOP",
				offset = { x = -120, y = -180, },
			},
			[24] = {
				point = "TOP",
				offset = { x = -120, y = -200, },
			},
			[25] = {
				point = "TOP",
				offset = { x = -120, y = -220, },
			},
			[26] = {
				point = "TOP",
				offset = { x = -120, y = -240, },
			},
			[27] = {
				point = "TOP",
				offset = { x = -120, y = -260, },
			},
			[28] = {
				point = "TOP",
				offset = { x = -120, y = -280, },
			},
			[29] = {
				point = "TOP",
				offset = { x = -120, y = -300, },
			},
			[30] = {
				point = "TOP",
				offset = { x = -20, y = -120, },
			},
			[31] = {
				point = "TOP",
				offset = { x = -20, y = -140, },
			},
			[32] = {
				point = "TOP",
				offset = { x = -20, y = -160, },
			},
			[33] = {
				point = "TOP",
				offset = { x = -20, y = -180, },
			},
			[34] = {
				point = "TOP",
				offset = { x = -20, y = -200, },
			},
			[35] = {
				point = "TOP",
				offset = { x = -20, y = -220, },
			},
			[36] = {
				point = "TOP",
				offset = { x = -20, y = -240, },
			},
			[37] = {
				point = "TOP",
				offset = { x = -20, y = -260, },
			},
			[38] = {
				point = "TOP",
				offset = { x = -20, y = -280, },
			},
			[39] = {
				point = "TOP",
				offset = { x = -20, y = -300, },
			},
		},
		text = {
			font = {
				family = fonts[0].path,
				size = 11,
				color = { r = 1, g = 1, b = 1, a = 1 },
			},
		},
		background = {
			visible = false,
			size = { width = 116, height = 16, },
			colors = {
				bg = { r = 0, g = 0, b = 0, a = 0.5 },
				border = { r = 1, g = 1, b = 1, a = 0.4 },
			},
		},
		visibility = {
			frameStrata = "HIGH",
		},
	},
}
local dbcDefault = {
	disabled = false,
}


--[[ FRAMES & EVENTS ]]

--[ Main Frame ]

--Creating frame
local partyTargets = CreateFrame("Frame", addonNameSpace, UIParent) --Main addon frame

--Registering events
partyTargets:RegisterEvent("ADDON_LOADED")
partyTargets:RegisterEvent("PLAYER_ENTERING_WORLD")
partyTargets:RegisterEvent("GROUP_ROSTER_UPDATE")

--Event handler
partyTargets:SetScript("OnEvent", function(self, event, ...)
	return self[event] and self[event](self, ...)
end)


--[[ UTILITIES ]]

---Add coloring escape sequences to a string
---@param text string Text to add coloring to
---@param color table Table containing the color values
--- - **r** number ― Red [Range: 0 - 1]
--- - **g** number ― Green [Range: 0 - 1]
--- - **b** number ― Blue [Range: 0 - 1]
--- - **a**? number *optional* ― Opacity [Range: 0 - 1, Default: 1]
---@return string
local function Color(text, color)
	local r, g, b, a = wt.UnpackColor(color)
	return WrapTextInColorCode(text, wt.ColorToHex(r, g, b, a, true, false))
end

---Find the ID of the font provided
---@param fontPath string
---@return integer
local function GetFontID(fontPath)
	local id = 0
	for i = 0, #fonts do
		if fonts[i].path == fontPath then
			id = i
			break
		end
	end
	return id
end

---Find the ID of the anchor point provided
---@param point AnchorPoint
---@return integer
local function GetAnchorID(point)
	local id = 0
	for i = 0, #anchors do
		if anchors[i].point == point then
			id = i
			break
		end
	end
	return id
end

--[ Target Frames Management ]

--Currently active group type ("party" | "raid")
local groupType = "party"

--Indexed table containing subtables with target frame and text references
local targetFrames = {}

---Create and add a new target Frame & FontString to the targetFrames table
local function CreateTargetFrame()
	--Create the subtable
	local index = targetFrames[0] == nil and 0 or #targetFrames + 1
	targetFrames[index] = {}
	--Create the frame & text
	targetFrames[index].frame = CreateFrame("Frame", partyTargets:GetName() .. "Display".. index + 1, partyTargets, BackdropTemplateMixin and "BackdropTemplate")
	targetFrames[index].text = targetFrames[index].frame:CreateFontString(targetFrames[index].frame:GetName() .. "Text", "OVERLAY")
	targetFrames[index].text:SetFont(fonts[0].path, 11, "THINOUTLINE")
	--Position & dimensions
	targetFrames[index].frame:SetSize(100, 16)
	-- targetFrames[index].frame:SetPoint("TOPLEFT", UIParent, db.display.position[index].point, db.display.position[index].offset.x, db.display.position[index].offset.y)
	targetFrames[index].frame:SetPoint("LEFT", _G["CompactRaidFrame" .. index + 1], "RIGHT", 0, 0)
	targetFrames[index].text:SetPoint("LEFT")
	--Making the frame moveable
	-- targetFrames[index].frame:SetMovable(true)
	-- targetFrames[index].frame:SetScript("OnMouseDown", function()
	-- 	if IsShiftKeyDown() and not targetFrames[index].frame.isMoving then
	-- 		targetFrames[index].frame:StartMoving()
	-- 		targetFrames[index].frame.isMoving = true
	-- 	end
	-- end)
	-- targetFrames[index].frame:SetScript("OnMouseUp", function()
	-- 	if targetFrames[index].frame.isMoving then
	-- 		targetFrames[index].frame:StopMovingOrSizing()
	-- 		targetFrames[index].frame.isMoving = false
	-- 	end
	-- end)
	--Start checking the target
	targetFrames[index].frame:SetScript("OnUpdate", function()
		local unitID = groupType .. index + 1 .. "target"
		--Update target name
		local max = UnitHealthMax(unitID)
		targetFrames[index].text:SetText("|T" .. textures.logo .. ":0|t " .. (UnitName(unitID) or ""))
		--Update target healt bar
		local healthPercentage = wt.FormatThousands(UnitHealth(unitID) / (max == 0 and 1 or max))
	end)
end

local function UpdateFrames()
	local members = GetNumGroupMembers()
	if members > 0 then
		local raidID = UnitInRaid("player")
		groupType = raidID and "raid" or "party"
		--Enable or create a target frames
		for i = 0, members - 1 do
			if targetFrames[i] == nil then CreateTargetFrame() else targetFrames[i].frame:Show() end
			-- if i + 1 == raidID or 1 then targetFrames[i].frame:Hide() end
		end
		--Disable unneeded target frames
		for i = members, #targetFrames do targetFrames[i].frame:Hide() end
	else
		--Disable all target frames
		for i = 0, #targetFrames do
			if targetFrames[i] == nil then break end
			targetFrames[i].frame:Hide()
		end
	end
end

--[ DB Management ]

--Check the validity of the provided key value pair
local function CheckValidity(k, v)
	if type(v) == "number" then
		--Non-negative
		if k == "size" then return v > 0 end
		--Range constraint: 0 - 1
		if k == "r" or k == "g" or k == "b" or k == "a" or k == "text" or k == "background" then return v >= 0 and v <= 1 end
	end return true
end

---Restore old data to an account-wide and character-specific DB by matching removed items to known old keys
---@param data table
---@param characterData table
---@param recoveredData? table
---@param recoveredCharacterData? table
local function RestoreOldData(data, characterData, recoveredData, recoveredCharacterData)
	-- if recoveredData ~= nil then for k, v in pairs(recoveredData) do
	-- 	if k == "" then data. = v
	-- 	elseif k == "" then data. = v
	-- 	end
	-- end end
	-- if recoveredCharacterData ~= nil then for k, v in pairs(recoveredCharacterData) do
	-- 	if k == "" then characterData. = v
	-- 	elseif k == "" then characterData. = v
	-- 	end
	-- end end
end

---Load the addon databases from the SavedVariables tables specified in the TOC
---@return boolean firstLoad True is returned when the addon SavedVariables tabled didn't exist prior to loading, false otherwise
local function LoadDBs()
	local firstLoad = false
	--First load
	if PartyTargetsDB == nil then
		PartyTargetsDB = wt.Clone(dbDefault)
		firstLoad = true
	end
	if PartyTargetsDBC == nil then PartyTargetsDBC = wt.Clone(dbcDefault) end
	if PartyTargetsCS == nil then PartyTargetsCS = {} end
	--Load the DBs
	db = wt.Clone(PartyTargetsDB) --Account-wide options DB copy
	dbc = wt.Clone(PartyTargetsDBC) --Character-specific options DB copy
	cs = PartyTargetsCS --Cross-session account-wide data direct reference
	--DB checkup & fix
	wt.RemoveEmpty(db, CheckValidity)
	wt.RemoveEmpty(dbc, CheckValidity)
	wt.AddMissing(db, dbDefault)
	wt.AddMissing(dbc, dbcDefault)
	RestoreOldData(db, dbc, wt.RemoveMismatch(db, dbDefault), wt.RemoveMismatch(dbc, dbcDefault))
	--Apply any potential fixes to the SavedVariables DBs
	PartyTargetsDB = wt.Clone(db)
	PartyTargetsDBC = wt.Clone(dbc)
	return firstLoad
end

--[ Target Display ]

---Set the size of the display elements
---@param display Frame Reference to the display frame
---@param text FontString Reference to the display text
---@param width number
---@param height number
local function ResizeDisplay(display, text, width, height)
	--Background
	display:SetSize(width, height)
	--Text
	text:SetSize(width, height)
end

---Set the backdrop of the dispaly elements
---@param display Frame Reference to the display frame
---@param enabled boolean Whether to add or remove the backdrop elements of the main dispaly
---@param backdropColors table Table containing the backdrop color values of all main dispaly elements
--- - **bg** table
--- 	- **r** number ― Red (Range: 0 - 1)
--- 	- **g** number ― Green (Range: 0 - 1)
--- 	- **b** number ― Blue (Range: 0 - 1)
--- 	- **a** number ― Opacity (Range: 0 - 1)
--- - **border** table
--- 	- **r** number ― Red (Range: 0 - 1)
--- 	- **g** number ― Green (Range: 0 - 1)
--- 	- **b** number ― Blue (Range: 0 - 1)
--- 	- **a** number ― Opacity (Range: 0 - 1)
local function SetDisplayBackdrop(display, enabled, backdropColors)
	if not enabled then display:SetBackdrop(nil)
	else
		display:SetBackdrop({
			bgFile = "Interface/ChatFrame/ChatFrameBackground",
			edgeFile = "Interface/ChatFrame/ChatFrameBackground",
			tile = true, tileSize = 5, edgeSize = 1,
			insets = { left = 0, right = 0, top = 0, bottom = 0 }
		})
		display:SetBackdropColor(wt.UnpackColor(backdropColors.bg))
		display:SetBackdropBorderColor(wt.UnpackColor(backdropColors.border))
	end
end

---Set the visibility, backdrop, font family, size and color of the display to the currently saved values
---@param display Frame Reference to the display frame
---@param text FontString Reference to the display text
---@param data table Accound-wide data table to set the display values from
---@param characterData table Character-specific data table to set the display values from
local function SetDisplayValues(display, text, data, characterData)
	--Visibility
	partyTargets:SetFrameStrata(data.display.visibility.frameStrata)
	wt.SetVisibility(partyTargets, not characterData.disabled)
	--Display
	ResizeDisplay(display, text, data.display.background.size.width, data.display.background.size.height)
	SetDisplayBackdrop(display, data.display.background.visible, data.display.background.colors)
	--Font & text
	text:SetFont(data.display.text.font.family, data.display.text.font.size, "THINOUTLINE")
	text:SetTextColor(wt.UnpackColor(data.display.text.font.color))
end


--[[ INTERFACE OPTIONS ]]

--Options frame references
local options = {
	about = {},
	presets = {},
	position = {},
	visibility = {
		fade = {},
	},
	background = {
		colors = {},
		size = {},
	},
	text = {
		font = {},
	},
	enhancement = {},
	removals = {},
	notifications = {},
	backup = {},
}

--[ Options Widgets ]

--Main page
local function CreateOptionsShortcuts(parentFrame)
	--Button: Advanced page
	wt.CreateButton({
		parent = parentFrame,
		position = {
			anchor = "TOPRIGHT",
			offset = { x = -10, y = -30 }
		},
		width = 120,
		label = strings.options.advanced.title,
		tooltip = { [0] = { text = strings.options.advanced.description:gsub("#ADDON", addon) }, },
		onClick = function() InterfaceOptionsFrame_OpenToCategory(options.advancedOptionsPage) end,
	})
end
local function CreateAboutInfo(parentFrame)
	--Text: Version
	local version = wt.CreateText({
		frame = parentFrame,
		name = "Version",
		position = {
			anchor = "TOPLEFT",
			offset = { x = 16, y = -33 }
		},
		width = 84,
		justify = "LEFT",
		template = "GameFontNormalSmall",
		text = strings.options.main.about.version:gsub("#VERSION", WrapTextInColorCode(GetAddOnMetadata(addonNameSpace, "Version"), "FFFFFFFF")),
	})
	--Text: Date
	local date = wt.CreateText({
		frame = parentFrame,
		name = "Date",
		position = {
			anchor = "TOPLEFT",
			relativeTo = version,
			relativePoint = "TOPRIGHT",
			offset = { x = 10, y = 0 }
		},
		width = 102,
		justify = "LEFT",
		template = "GameFontNormalSmall",
		text = strings.options.main.about.date:gsub(
			"#DATE", WrapTextInColorCode(strings.misc.date:gsub(
				"#DAY", GetAddOnMetadata(addonNameSpace, "X-Day")
			):gsub(
				"#MONTH", GetAddOnMetadata(addonNameSpace, "X-Month")
			):gsub(
				"#YEAR", GetAddOnMetadata(addonNameSpace, "X-Year")
			), "FFFFFFFF")
		),
	})
	--Text: Author
	local author = wt.CreateText({
		frame = parentFrame,
		name = "Author",
		position = {
			anchor = "TOPLEFT",
			relativeTo = date,
			relativePoint = "TOPRIGHT",
			offset = { x = 10, y = 0 }
		},
		width = 186,
		justify = "LEFT",
		template = "GameFontNormalSmall",
		text = strings.options.main.about.author:gsub("#AUTHOR", WrapTextInColorCode(GetAddOnMetadata(addonNameSpace, "Author"), "FFFFFFFF")),
	})
	--Text: License
	wt.CreateText({
		frame = parentFrame,
		name = "License",
		position = {
			anchor = "TOPLEFT",
			relativeTo = author,
			relativePoint = "TOPRIGHT",
			offset = { x = 10, y = 0 }
		},
		width = 156,
		justify = "LEFT",
		template = "GameFontNormalSmall",
		text = strings.options.main.about.license:gsub("#LICENSE", WrapTextInColorCode(GetAddOnMetadata(addonNameSpace, "X-License"), "FFFFFFFF")),
	})
	--EditScrollBox: Changelog
	options.about.changelog = wt.CreateEditScrollBox({
		parent = parentFrame,
		position = {
			anchor = "TOPLEFT",
			relativeTo = version,
			relativePoint = "BOTTOMLEFT",
			offset = { x = 0, y = -12 }
		},
		size = { width = parentFrame:GetWidth() - 32, height = 139 },
		fontObject = "GameFontDisableSmall",
		text = ns.GetChangelog(),
		label = strings.options.main.about.changelog.label,
		tooltip = { [0] = { text = strings.options.main.about.changelog.tooltip }, },
		scrollSpeed = 45,
		readOnly = true,
	})
end
local function CreateSupportInfo(parentFrame)
	--Copybox: CurseForge
	wt.CreateCopyBox({
		parent = parentFrame,
		name = "CurseForge",
		position = {
			anchor = "TOPLEFT",
			offset = { x = 16, y = -33 }
		},
		width = parentFrame:GetWidth() / 2 - 22,
		template = "GameFontNormalSmall",
		color = { r = 0.6, g = 0.8, b = 1, a = 1 },
		text = "curseforge.com/wow/addons/party-targets",
		label = strings.options.main.support.curseForge .. ":",
		colorOnMouse = { r = 0.75, g = 0.95, b = 1, a = 1 },
	})
	--Copybox: Wago
	wt.CreateCopyBox({
		parent = parentFrame,
		name = "Wago",
		position = {
			anchor = "TOP",
			offset = { x = (parentFrame:GetWidth() / 2 - 22) / 2 + 8, y = -33 }
		},
		width = parentFrame:GetWidth() / 2 - 22,
		template = "GameFontNormalSmall",
		color = { r = 0.6, g = 0.8, b = 1, a = 1 },
		text = "addons.wago.io/addons/party-targets",
		label = strings.options.main.support.wago .. ":",
		colorOnMouse = { r = 0.75, g = 0.95, b = 1, a = 1 },
	})
	--Copybox: BitBucket
	wt.CreateCopyBox({
		parent = parentFrame,
		name = "BitBucket",
		position = {
			anchor = "TOPLEFT",
			offset = { x = 16, y = -70 }
		},
		width = parentFrame:GetWidth() / 2 - 22,
		template = "GameFontNormalSmall",
		color = { r = 0.6, g = 0.8, b = 1, a = 1 },
		text = "bitbucket.org/Arxareon/party-targets",
		label = strings.options.main.support.bitBucket .. ":",
		colorOnMouse = { r = 0.75, g = 0.95, b = 1, a = 1 },
	})
	--Copybox: Issues
	wt.CreateCopyBox({
		parent = parentFrame,
		name = "Issues",
		position = {
			anchor = "TOP",
			offset = { x = (parentFrame:GetWidth() / 2 - 22) / 2 + 8, y = -70 }
		},
		width = parentFrame:GetWidth() / 2 - 22,
		template = "GameFontNormalSmall",
		color = { r = 0.6, g = 0.8, b = 1, a = 1 },
		text = "bitbucket.org/Arxareon/party-targets/issues",
		label = strings.options.main.support.issues .. ":",
		colorOnMouse = { r = 0.75, g = 0.95, b = 1, a = 1 },
	})
end
local function CreateMainCategoryPanels(parentFrame) --Add the main page widgets to the category panel frame
	--Shortcuts
	local shortcutsPanel = wt.CreatePanel({
		parent = parentFrame,
		position = {
			anchor = "TOPLEFT",
			offset = { x = 16, y = -82 }
		},
		size = { height = 64 },
		title = strings.options.main.shortcuts.title,
		description = strings.options.main.shortcuts.description:gsub("#ADDON", addon),
	})
	CreateOptionsShortcuts(shortcutsPanel)
	--About
	local aboutPanel = wt.CreatePanel({
		parent = parentFrame,
		position = {
			anchor = "TOPLEFT",
			relativeTo = shortcutsPanel,
			relativePoint = "BOTTOMLEFT",
			offset = { x = 0, y = -32 }
		},
		size = { height = 231 },
		title = strings.options.main.about.title,
		description = strings.options.main.about.description:gsub("#ADDON", addon),
	})
	CreateAboutInfo(aboutPanel)
	--Support
	local supportPanel = wt.CreatePanel({
		parent = parentFrame,
		position = {
			anchor = "TOPLEFT",
			relativeTo = aboutPanel,
			relativePoint = "BOTTOMLEFT",
			offset = { x = 0, y = -32 }
		},
		size = { height = 111 },
		title = strings.options.main.support.title,
		description = strings.options.main.support.description:gsub("#ADDON", addon),
	})
	CreateSupportInfo(supportPanel)
end

--Advanced page
local function CreateOptionsProfiles(parentFrame)
	--TODO: Add profiles handler widgets
end
local function CreateBackupOptions(parentFrame)
	--EditScrollBox & Popup: Import & Export
	local importPopup = wt.CreatePopup(addonNameSpace, {
		name = "IMPORT",
		text = strings.options.advanced.backup.warning,
		accept = strings.options.advanced.backup.import,
		onAccept = function()
			--Load from string to a temporary table
			local success, t = pcall(loadstring("return " .. wt.ClearFormatting(options.backup.string:GetText())))
			if success and type(t) == "table" then
				--Run DB checkup on the loaded table
				wt.RemoveEmpty(t.account, CheckValidity)
				wt.RemoveEmpty(t.character, CheckValidity)
				wt.AddMissing(t.account, db)
				wt.AddMissing(t.character, dbc)
				RestoreOldData(t.account, t.character, wt.RemoveMismatch(t.account, db), wt.RemoveMismatch(t.character, dbc))
				--Copy values from the loaded DBs to the addon DBs
				wt.CopyValues(t.account, db)
				wt.CopyValues(t.character, dbc)
				--Main display
				-- SetDisplayValues(mainDisplay, mainDisplayText, db, dbc)
				--Update the interface options
				wt.LoadOptionsData()
			else print(Color(addon .. ":", colors.red[0]) .. " " .. Color(strings.options.advanced.backup.error, colors.blue[0])) end
		end
	})
	local backupBox
	options.backup.string, backupBox = wt.CreateEditScrollBox({
		parent = parentFrame,
		name = "ImportExport",
		position = {
			anchor = "TOPLEFT",
			offset = { x = 16, y = -30 }
		},
		size = { width = parentFrame:GetWidth() - 32, height = 276 },
		maxLetters = 5400,
		fontObject = "GameFontWhiteSmall",
		label = strings.options.advanced.backup.backupBox.label,
		tooltip = {
			[0] = { text = strings.options.advanced.backup.backupBox.tooltip[0] },
			[1] = { text = strings.options.advanced.backup.backupBox.tooltip[1] },
			[2] = { text = "\n" .. strings.options.advanced.backup.backupBox.tooltip[2]:gsub("#ENTER", strings.keys.enter) },
			[3] = { text = strings.options.advanced.backup.backupBox.tooltip[3], color = { r = 0.89, g = 0.65, b = 0.40 } },
			[4] = { text = "\n" .. strings.options.advanced.backup.backupBox.tooltip[4], color = { r = 0.92, g = 0.34, b = 0.23 } },
		},
		scrollSpeed = 60,
		onEnterPressed = function() StaticPopup_Show(importPopup) end,
		onEscapePressed = function(self) self:SetText(wt.TableToString({ account = db, character = dbc }, options.backup.compact:GetChecked(), true)) end,
		onLoad = function(self) self:SetText(wt.TableToString({ account = db, character = dbc }, options.backup.compact:GetChecked(), true)) end,
	})
	--Checkbox: Compact
	options.backup.compact = wt.CreateCheckbox({
		parent = parentFrame,
		position = {
			anchor = "TOPLEFT",
			relativeTo = backupBox,
			relativePoint = "BOTTOMLEFT",
			offset = { x = -8, y = -13 }
		},
		label = strings.options.advanced.backup.compact.label,
		tooltip = { [0] = { text = strings.options.advanced.backup.compact.tooltip }, },
		onClick = function(self)
			options.backup.string:SetText(wt.TableToString({ account = db, character = dbc }, self:GetChecked(), true))
			--Set focus after text change to set the scroll to the top and refresh the position character counter
			options.backup.string:SetFocus()
			options.backup.string:ClearFocus()
		end,
		optionsData = {
			storageTable = cs,
			key = "compactBackup",
		},
	})
	--Button: Load
	local load = wt.CreateButton({
		parent = parentFrame,
		position = {
			anchor = "TOPRIGHT",
			relativeTo = backupBox,
			relativePoint = "BOTTOMRIGHT",
			offset = { x = 6, y = -13 }
		},
		width = 80,
		label = strings.options.advanced.backup.load.label,
		tooltip = { [0] = { text = strings.options.advanced.backup.load.tooltip }, },
		onClick = function() StaticPopup_Show(importPopup) end,
	})
	--Button: Reset
	wt.CreateButton({
		parent = parentFrame,
		position = {
			anchor = "TOPRIGHT",
			relativeTo = load,
			relativePoint = "TOPLEFT",
			offset = { x = -10, y = 0 }
		},
		width = 80,
		label = strings.options.advanced.backup.reset.label,
		tooltip = { [0] = { text = strings.options.advanced.backup.reset.tooltip }, },
		onClick = function()
			options.backup.string:SetText("") --Remove text to make sure OnTextChanged will get called
			options.backup.string:SetText(wt.TableToString({ account = db, character = dbc }, options.backup.compact:GetChecked(), true))
			--Set focus after text change to set the scroll to the top and refresh the position character counter
			options.backup.string:SetFocus()
			options.backup.string:ClearFocus()
		end,
	})
end
local function CreateAdvancedCategoryPanels(parentFrame) --Add the advanced page widgets to the category panel frame
	--Profiles
	local profilesPanel = wt.CreatePanel({
		parent = parentFrame,
		position = {
			anchor = "TOPLEFT",
			offset = { x = 16, y = -82 }
		},
		size = { height = 64 },
		title = strings.options.advanced.profiles.title,
		description = strings.options.advanced.profiles.description:gsub("#ADDON", addon),
	})
	CreateOptionsProfiles(profilesPanel)
	---Backup
	local backupOptions = wt.CreatePanel({
		parent = parentFrame,
		position = {
			anchor = "TOPLEFT",
			relativeTo = profilesPanel,
			relativePoint = "BOTTOMLEFT",
			offset = { x = 0, y = -32 }
		},
		size = { height = 374 },
		title = strings.options.advanced.backup.title,
		description = strings.options.advanced.backup.description:gsub("#ADDON", addon),
	})
	CreateBackupOptions(backupOptions)
end

--[ Options Category Panels ]

--Save the pending changes
local function SaveOptions()
	--Update the SavedVariabes DBs
	PartyTargetsDB = wt.Clone(db)
	PartyTargetsDBC = wt.Clone(dbc)
end
--Cancel all potential changes made in all option categories
local function CancelChanges()
	LoadDBs()
end
--Restore all the settings under the main option category to their default values
local function DefaultOptions()
	--Reset the DBs
	PartyTargetsDB = wt.Clone(dbDefault)
	PartyTargetsDBC = wt.Clone(dbcDefault)
	wt.CopyValues(dbDefault, db)
	wt.CopyValues(dbcDefault, dbc)
	--Update the interface options
	wt.LoadOptionsData()
	--Notification
	print(Color(addon .. ":", colors.red[0]) .. " " .. Color(strings.options.defaults, colors.blue[0]))
end

--Create and add the options category panel frames to the WoW Interface Options
local function LoadInterfaceOptions()
	--Main options panel
	options.mainOptionsPage = wt.CreateOptionsPanel({
		name = addonNameSpace .. "Main",
		title = addon,
		description = strings.options.main.description:gsub("#ADDON", addon):gsub("#KEYWORD", strings.chat.keyword),
		logo = textures.logo,
		titleLogo = true,
		okay = SaveOptions,
		cancel = CancelChanges,
		default = DefaultOptions,
	})
	CreateMainCategoryPanels(options.mainOptionsPage) --Add categories & GUI elements to the panel
	--Advanced options panel
	options.advancedOptionsPage = wt.CreateOptionsPanel({
		parent = options.mainOptionsPage.name,
		name = addonNameSpace .. "Advanced",
		title = strings.options.advanced.title,
		description = strings.options.advanced.description:gsub("#ADDON", addon),
		logo = textures.logo,
		default = DefaultOptions,
		autoSave = false,
		autoLoad = false,
	})
	CreateAdvancedCategoryPanels(options.advancedOptionsPage) --Add categories & GUI elements to the panel
end


--[[ CHAT CONTROL ]]

--[ Chat Utilities ]

---Print visibility info
---@param load boolean [Default: false]
local function PrintStatus(load)
	if load == true and not db.statusNotice then return end
	print(Color(partyTargets:IsVisible() and strings.chat.status.enabled:gsub(
		"#ADDON", Color(addon, colors.red[0])
	) or strings.chat.status.disabled:gsub(
		"#ADDON", Color(addon, colors.red[0])
	), colors.blue[0]))
end
--Print help info
local function PrintInfo()
	print(Color(strings.chat.help.thanks:gsub("#ADDON", Color(addon, colors.red[0])), colors.blue[0]))
	PrintStatus()
	print(Color(strings.chat.help.hint:gsub( "#HELP_COMMAND", Color(strings.chat.keyword .. " " .. strings.chat.help.command, colors.red[1])), colors.blue[1]))
	print(Color(strings.chat.help.move:gsub("#SHIFT", Color(strings.keys.shift, colors.red[1])):gsub("#ADDON", addon), colors.blue[1]))
end
--Print the command list with basic functionality info
local function PrintCommands()
	print(Color(addon, colors.red[0]) .. " ".. Color(strings.chat.help.list .. ":", colors.blue[0]))
	--Index the commands (skipping the help command) and put replacement code segments in place
	local commands = {
		[0] = {
			command = strings.chat.options.command,
			description = strings.chat.options.description:gsub("#ADDON", addon)
		},
		[1] = {
			command = strings.chat.toggle.command,
			description = strings.chat.toggle.description:gsub("#ADDON", addon):gsub(
				"#STATE", Color(dbc.disabled and strings.misc.disabled or strings.misc.enabled, colors.red[1])
			)
		},
	}
	--Print the list
	for i = 0, #commands do
		print("    " .. Color(strings.chat.keyword .. " " .. commands[i].command, colors.red[1]) .. Color(" - " .. commands[i].description, colors.blue[1]))
	end
end

--[ Slash Command Handlers ]

local function ToggleCommand()
	dbc.disabled = not dbc.disabled
	wt.SetVisibility(partyTargets, not dbc.disabled)
	--Response
	print(Color(dbc.disabled and strings.chat.toggle.disabled:gsub(
			"#ADDON", Color(addon, colors.red[0])
		) or strings.chat.toggle.enabled:gsub(
			"#ADDON", Color(addon, colors.red[0])
		), colors.blue[0]))
	--Update in the SavedVariabes DB
	PartyTargetsDBC.disabled = dbc.disabled
end

SLASH_PARTAR1 = strings.chat.keyword
function SlashCmdList.PARTAR(line)
	local command, parameter = strsplit(" ", line)
	if command == strings.chat.help.command then
		PrintCommands()
	elseif command == strings.chat.options.command then
		InterfaceOptionsFrame_OpenToCategory(options.mainOptionsPage)
		InterfaceOptionsFrame_OpenToCategory(options.mainOptionsPage) --Load twice to make sure the proper page and category is loaded
	elseif command == strings.chat.toggle.command then
		ToggleCommand()
	else
		PrintInfo()
	end
end


--[[ INITIALIZATION ]]

local function CreateContextMenuItems()
	return {
		{
			text = strings.options.name:gsub("#ADDON", addon),
			isTitle = true,
			notCheckable = true,
		},
		{
			text = strings.options.main.name,
			notCheckable = true,
			func = function()
				InterfaceOptionsFrame_OpenToCategory(options.mainOptionsPage)
				InterfaceOptionsFrame_OpenToCategory(options.mainOptionsPage) --Load twice to make sure the proper page and category is loaded
			end,
		},
		{
			text = strings.options.advanced.title,
			notCheckable = true,
			func = function()
				InterfaceOptionsFrame_OpenToCategory(options.advancedOptionsPage)
				InterfaceOptionsFrame_OpenToCategory(options.advancedOptionsPage) --Load twice to make sure the proper page and category is loaded
			end,
		},
	}
end

--[ Target Display Setup ]

--Set frame parameters
local function SetUpMainDisplayFrame()
	--Main frame
	partyTargets:SetToplevel(true)
	partyTargets:SetSize(16, 16)
	partyTargets:SetPoint("TOPLEFT", 2, -2)
	local logo = wt.CreateTexture({
		parent = partyTargets,
		name = "Icon",
		path = textures.logo,
		position = { anchor = "CENTER", },
		size = { width = 16, height = 16 },
	})
	logo:SetAlpha(0.6)
	--Context menu
	wt.CreateContextMenu({
		parent = partyTargets,
		menu = CreateContextMenuItems(),
	})
end

--[ Loading ]

function partyTargets:ADDON_LOADED(name)
	if name ~= addonNameSpace then return end
	partyTargets:UnregisterEvent("ADDON_LOADED")
	--Load & check the DBs
	if LoadDBs() then PrintInfo() end
	--Create cross-session character-specific variables
	if cs.compactBackup == nil then cs.compactBackup = true end
	--Set up the interface options
	LoadInterfaceOptions()
end
function partyTargets:PLAYER_ENTERING_WORLD()
	--Set up the main frame & text
	SetUpMainDisplayFrame()
	--Visibility notice
	if not partyTargets:IsVisible() then PrintStatus(true) end
	--Update target frames
	UpdateFrames()
end


--[[ TARGET UPDATES ]]

--Update target fames
function partyTargets:GROUP_ROSTER_UPDATE()
	UpdateFrames()
end