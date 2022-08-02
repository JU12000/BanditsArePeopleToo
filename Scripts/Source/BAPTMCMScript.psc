Scriptname BAPTMCMScript extends SKI_ConfigBase  

import FISSFactory
FISSInterface fiss

bool allowFISSOptions

int optionPricesMaxGetAwayFee
int optionPricesEmbershardMineFee
int optionPricesGatherFoodReward

int optionMiscFissImport
int optionMiscFissExport

int optionMiscDebugEnabled
int optionMiscEmbershardFactionToggle

Event OnConfigInit()
	fiss = FISSFactory.getFISS()

	If !fiss
		debug.Notification("BAPT: FISSES is not installed. Disabling Import/Export")
		allowFISSOptions = false
	Else
		allowFISSOptions = true
	EndIf

	debug.Notification("Remember, bandits are people too.")
EndEvent

Event OnPageReset(string page)
	If (page == "")

	ElseIf (page == "Prices")
		AddHeaderOption("General")
		AddEmptyOption()

		optionPricesMaxGetAwayFee = AddSliderOption("Maximum Bandit Bribe", BAPTMaxGetAwayFee.GetValue())
		optionPricesGatherFoodReward = AddSliderOption("Gather Food Quest Reward", BAPTGatherFoodReward.GetValue())

		AddEmptyOption()
		AddEmptyOption()

		AddHeaderOption("Embershard Mine")
		AddEmptyOption()

		optionPricesEmbershardMineFee = AddSliderOption("Embershard Mine Fee", BAPTEmbershardMineFee.GetValue())
	ElseIf (page == "Misc")
		If (allowFISSOptions)
			AddHeaderOption("FISSES")
			AddEmptyOption()

			optionMiscFISSImport = AddTextOption("Import", "")
			optionMiscFISSExport = AddTextOption("Export", "")

			AddEmptyOption()
			AddEmptyOption()
		EndIf

		optionMiscDebugEnabled = AddToggleOption("Debug Enabled", BAPTDebug.GetValueInt())
		AddEmptyOption()

		AddEmptyOption()
		AddEmptyOption()

		AddHeaderOption("Debug Options")
		AddEmptyOption()

		If (PlayerRef.GetFactionRank(BAPTEmbershardMineFaction) > -2)
			optionMiscEmbershardFactionToggle = AddToggleOption("Embershard Mine Faction Toggle", 1)
		Else
			optionMiscEmbershardFactionToggle = AddToggleOption("Embershard Mine Faction Toggle", 0)
		EndIf
		AddTextOption(BAPTEmbershardMineFavor.GetValueInt(), "")
	EndIf
EndEvent

Event OnOptionDefault(int option)
	If (option == optionMiscDebugEnabled)
		BAPTDebug.SetValue(0)
		SetToggleOptionValue(option, 0)
	ElseIf (option == optionMiscEmbershardFactionToggle)
		PlayerRef.RemoveFromFaction(BAPTEmbershardMineFaction)
		SetToggleOptionValue(option, 0)
	EndIf
EndEvent

Event OnOptionSelect(int option)
	If (option == optionMiscFISSImport)
		SetTextOptionValue(option, "")

		fiss.beginLoad("BanditsArePeopleToo.xml")
			BAPTMaxGetAwayFee.SetValue(fiss.loadFloat("BAPTMaxGetAwayFee"))
			BAPTEmbershardMine.UpdateCurrentInstanceGlobal(BAPTMaxGetAwayFee)
			SetSliderOptionValue(optionPricesMaxGetAwayFee, BAPTMaxGetAwayFee.GetValue())

			BAPTEmbershardMineFee.SetValue(fiss.loadFloat("BAPTEmbershardMineFee"))
			BAPTEmbershardMine.UpdateCurrentInstanceGlobal(BAPTEmbershardMineFee)
			SetSliderOptionValue(optionPricesEmbershardMineFee, BAPTEmbershardMineFee.GetValue())

			BAPTDebug.SetValue(fiss.loadInt("BAPTDebug"))
			SetToggleOptionValue(optionMiscDebugEnabled, BAPTDebug.GetValueInt())
		string loadResult = fiss.endLoad()

		If (loadResult != "")
			debug.Trace(loadResult)
			SetTextOptionValue(option, "Failure")
		Else
			SetTextOptionValue(option, "Success")
		EndIf
	ElseIf (option == optionMiscFISSExport)
		SetTextOptionValue(option, "")

		fiss.beginSave("BanditsArePeopleToo.xml", "BanditsArePeopleToo")
			fiss.saveFloat("BAPTMaxGetAwayFee", BAPTMaxGetAwayFee.GetValue())

			fiss.saveFloat("BAPTEmbershardMineFee", BAPTEmbershardMineFee.GetValue())

			fiss.saveInt("BAPTDebug", BAPTDebug.GetValueInt())
		string saveResult = fiss.endSave()

		If (saveResult != "")
			debug.Trace(saveResult)
			SetTextOptionValue(option, "Failure")
		Else
			SetTextOptionValue(option, "Success")
		EndIf
	ElseIf (option == optionMiscDebugEnabled)
		If (BAPTDebug.GetValueInt() == 0)
			BAPTDebug.SetValue(1)
		Else
			BAPTDebug.SetValue(0)
		EndIf

		SetToggleOptionValue(option, BAPTDebug.GetValueInt())
	ElseIf (option == optionMiscEmbershardFactionToggle)
		If (PlayerRef.GetFactionRank(BAPTEmbershardMineFaction) > -2)
			PlayerRef.RemoveFromFaction(BAPTEmbershardMineFaction)
			SetToggleOptionValue(option, 0)
		Else
			PlayerRef.AddToFaction(BAPTEmbershardMineFaction)
			SetToggleOptionValue(option, 1)
		EndIf
	EndIf
EndEvent

Event OnOptionSliderOpen(int option)
	If (option == optionPricesMaxGetAwayFee)
		SetSliderDialogStartValue(BAPTMaxGetAwayFee.GetValue())
		SetSliderDialogDefaultValue(50)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	ElseIf (option == optionPricesGatherFoodReward)
		SetSliderDialogStartValue(BAPTGatherFoodReward.GetValue())
		SetSliderDialogDefaultValue(50)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	ElseIf (option == optionPricesEmbershardMineFee)
		SetSliderDialogStartValue(BAPTEmbershardMineFee.GetValue())
		SetSliderDialogDefaultValue(100)
		SetSliderDialogRange(10, 500)
		SetSliderDialogInterval(10)
	EndIf
EndEvent

Event OnOptionSliderAccept(int option, float value)
	If (option == optionPricesMaxGetAwayFee)
		BAPTMaxGetAwayFee.SetValue(value)
		BAPTEmbershardMine.UpdateCurrentInstanceGlobal(BAPTMaxGetAwayFee)
		SetSliderOptionValue(option, value)
	ElseIf (option == optionPricesGatherFoodReward)
		BAPTGatherFoodReward.SetValue(value)
		BAPTGatherFoodEmbershardMine.UpdateCurrentInstanceGlobal(BAPTGatherFoodReward)
		SetSliderOptionValue(option, value)
	ElseIf (option == optionPricesEmbershardMineFee)
		BAPTEmbershardMineFee.SetValue(value)
		BAPTEmbershardMine.UpdateCurrentInstanceGlobal(BAPTEmbershardMineFee)
		SetSliderOptionValue(option, value)
	EndIf
EndEvent

GlobalVariable Property BAPTMaxGetAwayFee  Auto
GlobalVariable Property BAPTEmbershardMineFee  Auto
GlobalVariable Property BAPTGatherFoodReward Auto

GlobalVariable Property BAPTDebug Auto
GlobalVariable Property BAPTEmbershardMineFavor Auto

Actor Property PlayerRef  Auto

Faction Property BAPTEmbershardMineFaction  Auto

Quest Property BAPTEmbershardMine  Auto
Quest Property BAPTGatherFoodEmbershardMine Auto
