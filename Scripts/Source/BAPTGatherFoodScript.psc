Scriptname BAPTGatherFoodScript Extends Quest

Function Setup()
	BAPTGatherFoodCurrentAlcohol.SetValue(0)
	UpdateCurrentInstanceGlobal(BAPTGatherFoodCurrentAlcohol)

	BAPTGatherFoodCurrentDairy.SetValue(0)
	UpdateCurrentInstanceGlobal(BAPTGatherFoodCurrentDairy)

	BAPTGatherFoodCurrentMeat.SetValue(0)
	UpdateCurrentInstanceGlobal(BAPTGatherFoodCurrentMeat)

	BAPTGatherFoodCurrentProduce.SetValue(0)
	UpdateCurrentInstanceGlobal(BAPTGatherFoodCurrentProduce)

	Int totalAlcohol = 0
	Int totalDairy = 0
	Int totalMeat = 0
	Int totalProduce = 0

	Int i = 0
	While (i < BAPTGatherFoodTotalItems.GetValue())
		Int x = Utility.RandomInt(aiMax = 3)

		If (x == 0)
			totalAlcohol += 1
		ElseIf (x == 1)
			totalDairy += 1
		ElseIf (x == 2)
			totalMeat += 1
		ElseIf (x == 3)
			totalProduce += 1
		EndIf

		i += 1
	EndWhile

	If (totalAlcohol > 0)
		BAPTGatherFoodTotalAlcohol.SetValue(totalAlcohol)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodTotalAlcohol)
		SetObjectiveDisplayed(0)
	Else
		SetObjectiveCompleted(0, True)
	EndIf

	If (totalDairy > 0)
		BAPTGatherFoodTotalDairy.SetValue(totalDairy)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodTotalDairy)
		SetObjectiveDisplayed(1)
	Else
		SetObjectiveCompleted(1, True)
	EndIf

	If (totalMeat > 0)
		BAPTGatherFoodTotalMeat.SetValue(totalMeat)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodTotalMeat)
		SetObjectiveDisplayed(2)
	Else
		SetObjectiveCompleted(2, True)
	EndIf

	If (totalProduce > 0)
		BAPTGatherFoodTotalProduce.SetValue(totalProduce)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodTotalProduce)
		SetObjectiveDisplayed(3)
	Else
		SetObjectiveCompleted(3, True)
	EndIf
EndFunction

Function ChangeQuestObjectiveCount(Form item, Int deltaCount)
	Int updatedQuestObjective = -1
	Int currentCount = 0
	Int totalCount = 0

	If (BAPTGatherFoodAlcohol.HasForm(item))
		BAPTGatherFoodCurrentAlcohol.SetValue(BAPTGatherFoodCurrentAlcohol.GetValue() + deltaCount)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodCurrentAlcohol)

		updatedQuestObjective = 0
		currentCount = BAPTGatherFoodCurrentAlcohol.GetValue() as Int
		totalCount = BAPTGatherFoodTotalAlcohol.GetValue() as Int
	ElseIf (BAPTGatherFoodDairy.HasForm(item))
		BAPTGatherFoodCurrentDairy.SetValue(BAPTGatherFoodCurrentDairy.GetValue() + deltaCount)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodCurrentDairy)

		updatedQuestObjective = 1
		currentCount = BAPTGatherFoodCurrentDairy.GetValue() as Int
		totalCount = BAPTGatherFoodTotalDairy.GetValue() as Int
	ElseIf (BAPTGatherFoodMeat.HasForm(item))
		BAPTGatherFoodCurrentMeat.SetValue(BAPTGatherFoodCurrentMeat.GetValue() + deltaCount)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodCurrentMeat)

		updatedQuestObjective = 2
		currentCount = BAPTGatherFoodCurrentMeat.GetValue() as Int
		totalCount = BAPTGatherFoodTotalMeat.GetValue() as Int
	ElseIf (BAPTGatherFoodProduce.HasForm(item))
		BAPTGatherFoodCurrentProduce.SetValue(BAPTGatherFoodCurrentProduce.GetValue() + deltaCount)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodCurrentProduce)

		updatedQuestObjective = 3
		currentCount = BAPTGatherFoodCurrentProduce.GetValue() as Int
		totalCount = BAPTGatherFoodCurrentProduce.GetValue() as Int
	EndIf

	If (currentCount >= totalCount)
		SetObjectiveCompleted(updatedQuestObjective)
	ElseIf (totalCount > 0)
		SetObjectiveCompleted(updatedQuestObjective, False)
		SetObjectiveDisplayed(updatedQuestObjective, True, True)
	EndIf

	If (IsObjectiveCompleted(0) && IsObjectiveCompleted(1) && IsObjectiveCompleted(2) && IsObjectiveCompleted(3))
		SetObjectiveDisplayed(10)
	Else
		SetObjectiveDisplayed(10, False)
	EndIf

	Int deltaObjectiveItems = 0
	If (((currentCount - deltaCount) >= totalCount) && (currentCount < totalCount))
		deltaObjectiveItems = deltaCount + ((currentCount - deltaCount) - totalCount)
	ElseIf (((currentCount - deltaCount) < totalCount) && (currentCount >= totalCount))
		deltaObjectiveItems = deltaCount - (currentCount - totalCount)
	ElseIf (((currentCount - deltaCount) < totalCount) && (currentCount < totalCount))
		deltaObjectiveItems = deltaCount
	EndIf

	RewardBase += deltaObjectiveItems * item.GetGoldValue()
EndFunction

Function FinishQuest()
	PlayerRef.AddItem(Gold001, (RewardBase * BAPTGatherFoodRewardMult.GetValue()) as Int)
	BAPTLocationFavor.SetValue(BAPTLocationFavor.GetValue() + 2)

	CompleteAllObjectives()
	Stop()
EndFunction

Actor Property PlayerRef Auto

FormList Property BAPTGatherFoodAlcohol Auto
FormList Property BAPTGatherFoodDairy Auto
FormList Property BAPTGatherFoodMeat Auto
FormList Property BAPTGatherFoodProduce Auto

GlobalVariable Property BAPTDebug Auto
GlobalVariable Property BAPTGatherFoodCurrentAlcohol Auto
GlobalVariable Property BAPTGatherFoodCurrentDairy Auto
GlobalVariable Property BAPTGatherFoodCurrentMeat Auto
GlobalVariable Property BAPTGatherFoodCurrentProduce Auto
GlobalVariable Property BAPTGatherFoodRewardMult Auto
GlobalVariable Property BAPTGatherFoodTotalAlcohol Auto
GlobalVariable Property BAPTGatherFoodTotalDairy Auto
GlobalVariable Property BAPTGatherFoodTotalItems Auto
GlobalVariable Property BAPTGatherFoodTotalMeat Auto
GlobalVariable Property BAPTGatherFoodTotalProduce Auto
GlobalVariable Property BAPTLocationFavor Auto

Float Property RewardBase Auto

MiscObject Property Gold001 Auto
