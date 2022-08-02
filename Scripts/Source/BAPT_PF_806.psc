;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BAPT_PF_806 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
akActor.SetActorValue("Variable01", 1)

(BAPTEmbershardMine as BAPTEmbershardMineScript).RegisterForSingleUpdateGameTime(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BAPTEmbershardMine Auto
