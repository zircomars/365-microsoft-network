$caption = "This is the caption"
$message = "This is the message"
$choices = [System.Management.Automation.Host.ChoiceDescription[]] `
 @("&choice1", "c&hoice2", "ch&oice3")


 [int]$DefaultChoice = 2
 $choiceRTN = $host.ui.PromptForChoice($caption,$message, $choices,$defaultChoice)

 switch($choiceRTN)
 {
 0 { "choice1" }
 1 { "choice2" }
 2 { "choice3" }
 }


