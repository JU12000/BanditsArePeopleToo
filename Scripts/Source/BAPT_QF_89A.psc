;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname BAPT_QF_89A Extends Quest Hidden

;BEGIN ALIAS PROPERTY BAPTSmeltOreQuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTSmeltOreQuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTSmeltOreEmbershardLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BAPTSmeltOreEmbershardLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
If (BAPTDebug.GetValueInt() == 1)
	Debug.MessageBox("Embershard Mine Leader Killed, Failing Quest")
EndIf

(Alias_PlayerRef as BAPTSmeltOrePlayerRefScript).Cleanup()

FailAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BAPTSmeltOreScript
Quest __temp = self as Quest
BAPTSmeltOreScript kmyQuest = __temp as BAPTSmeltOreScript
;END AUTOCAST
;BEGIN CODE
If (BAPTDebug.GetValueInt() == 1)
	Debug.MessageBox("BAPTSmeltOreEmbershardMine Finished")
EndIf

(Alias_PlayerRef as BAPTSmeltOrePlayerRefScript).Cleanup()

kmyQuest.FinishQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BAPTSmeltOreScript
Quest __temp = self as Quest
BAPTSmeltOreScript kmyQuest = __temp as BAPTSmeltOreScript
;END AUTOCAST
;BEGIN CODE
If (BAPTDebug.GetValueInt() == 1)
	Debug.MessageBox("BAPTSmeltOreEmbershardMine Started")
EndIf

kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BAPTDebug Auto
