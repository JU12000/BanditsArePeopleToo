Scriptname BAPTSmeltOrePlayerRefScript Extends ReferenceAlias

Event OnInit()
	AddInventoryEventFilter(IngotIron)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If (BAPTSmeltOre.IsObjectiveCompleted(10))
		Return
	EndIf

	(BAPTSmeltOre as BAPTSmeltOreScript).ChangeQuestObjectiveCount(aiItemCount)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	If (BAPTSmeltOre.IsObjectiveCompleted(10) || BAPTSmeltOre.IsStarting())
		Return
	EndIf

	(BAPTSmeltOre as BAPTSmeltOreScript).ChangeQuestObjectiveCount(-aiItemCount)
EndEvent

Function Cleanup()
	RemoveAllInventoryEventFilters()
EndFunction

GlobalVariable Property BAPTDebug Auto

MiscObject Property IngotIron Auto

Quest Property BAPTSmeltOre Auto
