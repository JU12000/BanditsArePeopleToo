Scriptname BAPTEmbershardMineScript Extends Quest

Event OnUpdateGameTime()
	Actor entranceBandit = BAPTEmbershardEntranceBandit.GetActorReference()

	If (entranceBandit.GetActorValue("Variable01") == 1)
		entranceBandit.SetActorValue("Variable01", 0)
		entranceBandit.EvaluatePackage()

		If (BAPTDebug.GetValue() == 1)
			Debug.Notification("BAPTEmbershardMineEntranceBandit ForceGreet Enabled")
		EndIf
	EndIf

	; Case where the player rented the mine but hasn't joined the bandits
	If (PlayerRef.IsInFaction(BAPTEmbershardMineFaction) && !PlayerRef.IsInFaction(BAPTEmbershardMineOwnershipFaction))
		BAPTEmbershardMine.SetObjectiveDisplayed(0, False)
		PlayerRef.RemoveFromFaction(BAPTEmbershardMineFaction)

		If (BAPTDebug.GetValue() == 1)
			Debug.Notification("Embershard Mine Rental Ended")
		EndIf
	; Case where the player rented the mine and joined the bandits
	ElseIf (PlayerRef.IsInFaction(BAPTEmbershardMineFaction) && PlayerRef.IsInFaction(BAPTEmbershardMineOwnershipFaction))
		BAPTEmbershardMine.SetObjectiveDisplayed(0, False)

		If (BAPTDebug.GetValue() == 1)
			Debug.Notification("Embershard Mine Rental Ended, Player Still In Faction")
		EndIf
	EndIf
EndEvent

Function DisableOwnership()
	EnumerateOwnership(EmbershardMine01.GetNumRefs(27), 27) ;Book
	EnumerateOwnership(EmbershardMine01.GetNumRefs(28), 28) ;Container
	EnumerateOwnership(EmbershardMine01.GetNumRefs(39), 39) ;Flora
	EnumerateOwnership(EmbershardMine01.GetNumRefs(40), 40) ;Furniture
	EnumerateOwnership(EmbershardMine01.GetNumRefs(30), 30) ;Ingredient
	EnumerateOwnership(EmbershardMine01.GetNumRefs(32), 32) ;Misc
	EnumerateOwnership(EmbershardMine01.GetNumRefs(46), 46) ;Potion (Food)
	EnumerateOwnership(EmbershardMine01.GetNumRefs(41), 41) ;Weapon
EndFunction

Function EnumerateOwnership(Int numRefs, Int formTypeFilter)
	While (numRefs)
		numRefs -= 1
		ObjectReference reference = EmbershardMine01.GetNthRef(numRefs, formTypeFilter)
		reference.SetFactionOwner(None)
	EndWhile
EndFunction

Actor Property PlayerRef Auto

Cell Property EmbershardMine01 Auto

Faction Property BAPTEmbershardMineFaction Auto
Faction Property BAPTEmbershardMineOwnershipFaction Auto

GlobalVariable Property BAPTDebug Auto
GlobalVariable Property BAPTEmbershardMineFavor Auto

Quest Property BAPTEmbershardMine Auto

ReferenceAlias Property BAPTEmbershardEntranceBandit Auto
