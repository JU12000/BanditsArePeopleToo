;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BAPT_TIF_829 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.AddToFaction(BAPTEmbershardMineFaction)

If (BAPTDebug.GetValue() == 1)
	Debug.Notification("Embershard Mine Rental Started")
EndIf

Quest embershardMine = GetOwningQuest()

embershardMine.SetObjectiveDisplayed(0, abForce = True)

(embershardMine as BAPTEmbershardMineScript).RegisterForSingleUpdateGameTime(24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.RemoveItem(Gold001, BAPTEmbershardMineFee.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef Auto

Faction Property BAPTEmbershardMineFaction Auto

GlobalVariable Property BAPTDebug Auto
GlobalVariable Property BAPTEmbershardMineFee Auto

MiscObject Property Gold001 Auto
