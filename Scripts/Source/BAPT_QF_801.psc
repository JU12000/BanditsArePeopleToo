;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname BAPT_QF_801 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BAPTEmbershardBridgeBandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTEmbershardBridgeBandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTEmbershardBridgesLever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTEmbershardBridgesLever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTEmbershardLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BAPTEmbershardLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTEmbershardAlertBandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTEmbershardAlertBandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTEmbershardLeaderBandit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTEmbershardLeaderBandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTEmbershardAlertBandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTEmbershardAlertBandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTEmbershardBridgeBandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTEmbershardBridgeBandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTEmbershardEntranceBandit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTEmbershardEntranceBandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTEmbershardLootRoomBandit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTEmbershardLootRoomBandit Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardAlertBandit1 Killed")
EndIf

SetObjectiveCompleted(93)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardEntranceBandit Killed")
EndIf

SetObjectiveCompleted(90)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	debug.MessageBox("BAPTEmbershardMine Started")
EndIf

SetObjectiveDisplayed(0, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardAlertBandit2 Killed")
EndIf

SetObjectiveCompleted(94)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardArcherBandit Killed")
EndIf

SetObjectiveCompleted(98)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Set if the player comes in the unexpected way

If (BAPTDebug.GetValue() == 1)
	Debug.Notification("Player Entered Back Entrance")
EndIf

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardBridgeBandit1 Killed")
EndIf

SetObjectiveCompleted(91)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Set if the player comes in the expected way.

If (BAPTDebug.GetValue() == 1)
	Debug.Notification("Player Entered Main Entrance")
EndIf

If (!PlayerRef.IsInFaction(BAPTEmbershardMineFaction))
	If (BAPTDebug.GetValue() == 1)
		Debug.Notification("Starting Vanilla Bridge Bandits Scene")
	EndIf

	BAPTEmbershardBridgeBanditsScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Gets set when the lever for the two bridges gets pulled

If (BAPTDebug.GetValue() == 1)
	Debug.Notification("Player Pulled Bridges Lever")
EndIf

If (Alias_BAPTEmbershardBridgeBandit1.GetActorReference().IsDead() && Alias_BAPTEmbershardBridgeBandit2.GetActorReference().IsDead() && !IsStageDone(30) && !PlayerRef.IsInFaction(BAPTEmbershardMineFaction))
	;Start Bandit Alert Scene
	If (BAPTDebug.GetValue() == 1)
		Debug.Notification("Starting Vanilla Bandit Alert Scene")
	EndIf

	BAPTEmbershardAlertBanditsScene.ForceStart()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardLeaderBandit Killed")
EndIf

SetObjectiveCompleted(97)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardForgeBandit Killed")
EndIf

SetObjectiveCompleted(96)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardLootRoomBandit Killed")
EndIf

SetObjectiveCompleted(95)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.Notification("BAPTEmbershardBridgeBandit2 Killed")
EndIf

SetObjectiveCompleted(92)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE BAPTEmbershardMineScript
Quest __temp = self as Quest
BAPTEmbershardMineScript kmyQuest = __temp as BAPTEmbershardMineScript
;END AUTOCAST
;BEGIN CODE
If (IsObjectiveCompleted(90) && IsObjectiveCompleted(91) && IsObjectiveCompleted(92) && IsObjectiveCompleted(93) && IsObjectiveCompleted(94) && IsObjectiveCompleted(95) && IsObjectiveCompleted(96) && IsObjectiveCompleted(97) && IsObjectiveCompleted(98))
	If (BAPTDebug.GetValue() == 1)
		Debug.Notification("All Bandits Dead, Freeing Ownership of Embershard Mine")
	EndIf

	kmyQuest.DisableOwnership()

	If (PlayerRef.IsInFaction(BAPTEmbershardMineFaction))
		PlayerRef.RemoveFromFaction(BAPTEmbershardMineFaction)
	EndIf

	If (PlayerRef.IsInFaction(BAPTEmbershardMineOwnershipFaction))
		PlayerRef.RemoveFromFaction(BAPTEmbershardMineOwnershipFaction)
	EndIf

	;Reset the quest, clear crime gold and reset relationship with faction
	BAPTEmbershardMineOwnershipFaction.SetCrimeGold(0)
	BAPTEmbershardMineOwnershipFaction.SetCrimeGoldViolent(0)
	BAPTEmbershardMineFavor.SetValueInt(0)
	Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BAPTDebug Auto
GlobalVariable Property BAPTEmbershardMineFavor Auto

Actor Property PlayerRef Auto

Faction Property BAPTEmbershardMineFaction Auto
Faction Property BAPTEmbershardMineOwnershipFaction Auto

Scene Property BAPTEmbershardAlertBanditsScene Auto
Scene Property BAPTEmbershardBridgeBanditsScene Auto
