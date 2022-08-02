Scriptname BAPTOnPlayerActivateCompleteObjective Extends ReferenceAlias

Event OnActivate(ObjectReference akActionRef)
	If (akActionRef == Game.GetPlayer())
		OwningQuest.SetObjectiveCompleted(QuestObjective)
	EndIf
EndEvent

Int Property QuestObjective Auto

Quest Property OwningQuest Auto
