Scriptname BAPTSmeltOreScript Extends Quest

Function Setup()
	BAPTSmeltOreCurrentIngots.SetValue(0)
	UpdateCurrentInstanceGlobal(BAPTSmeltOreCurrentIngots)

	Int totalIngots = Utility.RandomInt(aiMin = BAPTSmeltOreMinTotalIngots.GetValue() as Int, aiMax = BAPTSmeltOreMaxTotalIngots.GetValue() as Int)
	BAPTSmeltOreTotalIngots.SetValue(totalIngots)
	UpdateCurrentInstanceGlobal(BAPTSmeltOreTotalIngots)

	PlayerRef.AddItem(RecipeIngot.GetNthIngredient(0), totalIngots * RecipeIngot.GetNthIngredientQuantity(0))

	SetObjectiveDisplayed(0)

	Int currentItems = 0
	currentItems = PlayerRef.GetItemCount(RecipeIngot.GetResult())

	ChangeQuestObjectiveCount(currentItems)
EndFunction

Function ChangeQuestObjectiveCount(Int deltaCount)
	BAPTSmeltOreCurrentIngots.SetValue(BAPTSmeltOreCurrentIngots.GetValue() + deltaCount)
	UpdateCurrentInstanceGlobal(BAPTSmeltOreCurrentIngots)

	If (BAPTSmeltOreCurrentIngots.GetValue() >= BAPTSmeltOreTotalIngots.GetValue())
		SetObjectiveCompleted(0)
		SetObjectiveDisplayed(10)
	Else
		SetObjectiveCompleted(0, False)
		SetObjectiveDisplayed(10, False)
		SetObjectiveDisplayed(0, True, True)
	EndIf
EndFunction

Function FinishQuest()
	PlayerRef.RemoveItem(RecipeIngot.GetResult(), BAPTSmeltOreTotalIngots.GetValue() as Int)
	PlayerRef.AddItem(Gold001, BAPTSmeltOreReward.GetValue() as Int)
	BAPTLocationFavor.SetValue(BAPTLocationFavor.GetValue() + 2)

	CompleteAllObjectives()
	Stop()
EndFunction

Actor Property PlayerRef Auto

ConstructibleObject Property RecipeIngot Auto

GlobalVariable Property BAPTLocationFavor Auto
GlobalVariable Property BAPTDebug Auto
GlobalVariable Property BAPTSmeltOreCurrentIngots Auto
GlobalVariable Property BAPTSmeltOreMaxTotalIngots Auto
GlobalVariable Property BAPTSmeltOreMinTotalIngots Auto
GlobalVariable Property BAPTSmeltOreReward Auto
GlobalVariable Property BAPTSmeltOreTotalIngots Auto

MiscObject Property Gold001 Auto
