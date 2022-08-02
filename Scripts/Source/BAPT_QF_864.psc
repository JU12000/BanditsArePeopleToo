;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname BAPT_QF_864 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BAPTGatherFoodEmbershardLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BAPTGatherFoodEmbershardLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTGatherFoodContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTGatherFoodContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BAPTGatherFoodQuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BAPTGatherFoodQuestGiver Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BAPTGatherFoodScript
Quest __temp = self as Quest
BAPTGatherFoodScript kmyQuest = __temp as BAPTGatherFoodScript
;END AUTOCAST
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.MessageBox("BAPTGatherFoodEmbershardMine Started")
EndIf

kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
If (BAPTDebug.GetValue() == 1)
	Debug.MessageBox("Embershard Mine Leader Killed, Failing Quest")
EndIf

(Alias_BAPTGatherFoodContainer as BAPTGatherFoodContainerScript).Cleanup(True)

FailAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BAPTGatherFoodScript
Quest __temp = self as Quest
BAPTGatherFoodScript kmyQuest = __temp as BAPTGatherFoodScript
;END AUTOCAST
;BEGIN CODE
If (BAPTDebug.GetValueInt() == 1)
	Debug.MessageBox("BAPTGatherFoodEmbershardMine Finished")
EndIf

(Alias_BAPTGatherFoodContainer as BAPTGatherFoodContainerScript).Cleanup()

kmyQuest.FinishQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BAPTDebug Auto
