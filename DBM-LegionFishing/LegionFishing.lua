local mod	= DBM:NewMod("FishingLegion", "DBM-LegionFishing")

mod:SetRevision("@file-date-integer@")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)
mod:RegisterEvents(
	"PLAYER_ENTERING_WORLD",
	"ZONE_CHANGED_NEW_AREA"
)

do
	function mod:ZONE_CHANGED_NEW_AREA()
		local currentZoneID = C_Map.GetBestMapForUnit("player")
		-- Dalaran, Azsuna, Stormheim, Val'sharah, Broken Shore, Highmountain, Suramar
		if currentZoneID == 619 or currentZoneID == 630 or currentZoneID == 634 or currentZoneID == 641 or currentZoneID == 646 or currentZoneID == 650 or currentZoneID == 680 then
			self:RegisterShortTermEvents("UNIT_DIED")
		else
			self:UnregisterShortTermEvents()
		end
	end
	mod.PLAYER_ENTERING_WORLD	= mod.ZONE_CHANGED_NEW_AREA
	mod.OnInitialize			= mod.ZONE_CHANGED_NEW_AREA
end

do
	local buffTimer = mod:NewTimer(120, "TimerBuff", "132844")

	function mod:UNIT_DIED(args)
		local cid = self:GetCIDFromGUID(args.destGUID)
		-- Dalaran, Azsuna, Stormheim, Val'sharah, Broken Shore, Highmountain, Suramar
		if cid == 113378 or cid == 120375 or cid == 120452 or cid == 120451 or cid == 120455 or cid == 120453 or cid == 120454 then
			if buffTimer:IsStarted() then
				buffTimer:Update(0, 120)
			else
				buffTimer:Start()
			end
		end
	end
end
