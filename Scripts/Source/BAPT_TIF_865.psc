;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BAPT_TIF_865 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.MessageBox("Player Joined Embershard Mine Bandits")
EndIf

Game.GetPlayer().AddToFaction(BAPTEmbershardMineOwnershipFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BAPTEmbershardMineOwnershipFaction Auto

GlobalVariable Property BAPTDebug Auto
