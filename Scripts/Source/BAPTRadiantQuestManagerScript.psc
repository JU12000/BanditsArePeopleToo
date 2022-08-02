Scriptname BAPTRadiantQuestManagerScript Extends Quest

Function StartQuest()
	If (AttemptingToStartQuest == "BAPTGatherFood")
		BAPTGatherFoodEmbershardMine.Start()
		BAPTGatherFoodEmbershardMineCooldown.SetValue(Utility.GetCurrentGameTime() + 3)
		UpdateCurrentInstanceGlobal(BAPTGatherFoodEmbershardMineCooldown)
	ElseIf (AttemptingToStartQuest == "BAPTSmeltOre")
		BAPTSmeltOreEmbershardMine.Start()
		BAPTSmeltOreEmbershardMineCooldown.SetValue(Utility.GetCurrentGameTime() + 1)
		UpdateCurrentInstanceGlobal(BAPTSmeltOreEmbershardMineCooldown)
	EndIf
EndFunction

GlobalVariable Property BAPTGatherFoodEmbershardMineCooldown Auto
GlobalVariable Property BAPTSmeltOreEmbershardMineCooldown Auto

Quest Property BAPTGatherFoodEmbershardMine Auto
Quest Property BAPTSmeltOreEmbershardMine Auto

String Property AttemptingToStartQuest Auto
