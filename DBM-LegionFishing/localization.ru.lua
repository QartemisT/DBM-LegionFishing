if GetLocale() ~= "ruRU" then return end
local L = DBM:GetModLocalization("FishingLegion")

L:SetGeneralLocalization({
	name	= "Рыбалка в Легионе"
})

L:SetTimerLocalization({
	TimerBuff	= "Бафф"
})
