Scriptname BAPTGatherFoodContainerScript Extends ReferenceAlias

Event OnInit()
	ObjectReference foodContainer = GetReference()

	ContainerOriginalFaction = foodContainer.GetFactionOwner()
	foodContainer.SetFactionOwner(None)
	foodContainer.RemoveAllItems(abRemoveQuestItems = True)

	AddInventoryEventFilter(BAPTGatherFoodMeat)
	AddInventoryEventFilter(BAPTGatherFoodDairy)
	AddInventoryEventFilter(BAPTGatherFoodProduce)
	AddInventoryEventFilter(BAPTGatherFoodAlcohol)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If (BAPTGatherFood.IsObjectiveCompleted(10))
		Return
	EndIf

	If (BAPTDebug.GetValue() == 1)
		Debug.Notification("Added " + akBaseItem.GetName() + " to Container")
	EndIf

	(BAPTGatherFood as BAPTGatherFoodScript).ChangeQuestObjectiveCount(akBaseItem, aiItemCount)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	If (BAPTGatherFood.IsObjectiveCompleted(10) || BAPTGatherFood.IsStarting())
		Return
	EndIf

	If (BAPTDebug.GetValue() == 1)
		Debug.Notification("Removed " + akBaseItem.GetName() + " from Container")
	EndIf

	(BAPTGatherFood as BAPTGatherFoodScript).ChangeQuestObjectiveCount(akBaseItem, -aiItemCount)
EndEvent

Function Cleanup(Bool questFailed = False)
	RemoveAllInventoryEventFilters()

	If (questFailed)
		GetReference().RemoveAllItems(Game.GetPlayer(), abRemoveQuestItems = True)
	EndIf

	GetReference().SetFactionOwner(ContainerOriginalFaction)
EndFunction

Faction Property ContainerOriginalFaction Auto

FormList Property BAPTGatherFoodAlcohol Auto
FormList Property BAPTGatherFoodDairy Auto
FormList Property BAPTGatherFoodMeat Auto
FormList Property BAPTGatherFoodProduce Auto

GlobalVariable Property BAPTDebug Auto

Quest Property BAPTGatherFood Auto
